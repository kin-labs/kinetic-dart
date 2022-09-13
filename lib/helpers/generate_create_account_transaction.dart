import 'dart:convert';

import 'package:kinetic/commitment.dart';
import 'package:kinetic/constants.dart';
import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/interfaces/kinetic_sdk_config.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

Future<Transaction?> generateCreateAccountTransaction(KineticSdkConfig sdkConfig, String mint, Ed25519HDKeyPair from, String feePayer, {List fk = const []}) async {

  final hopSignerPublicKey = Ed25519HDPublicKey.fromBase58(feePayer);

  final derivedAddress = await findAssociatedTokenAddress(
    owner: from.publicKey,
    mint: Ed25519HDPublicKey.fromBase58(mint),
  );

  List<Ed25519HDPublicKey> signersPublic = [from.publicKey, hopSignerPublicKey];

  final createATAInstruction = AssociatedTokenAccountInstruction.createAccount(
    funder: hopSignerPublicKey,
    address: derivedAddress,
    owner: from.publicKey,
    mint: Ed25519HDPublicKey.fromBase58(mint),
  );

  final authorityInstruction = TokenInstruction.setAuthority(
    mintOrAccount: derivedAddress,
    authorityType: AuthorityType.closeAccount,
    currentAuthority: from.publicKey,
    newAuthority: hopSignerPublicKey,
    signers: signersPublic,
  );

  var b = createKinMemoInstruction(TransactionType.none, sdkConfig.index);

  final message = Message(
    instructions: [
      MemoInstruction(signers: [], memo: base64Encode(b)),
      createATAInstruction,
      authorityInstruction,
    ],
  );

  TransactionApi _apiInstance = TransactionApi();
  LatestBlockhashResponse? latestBlockhashResponse = await _apiInstance.getLatestBlockhash(sdkConfig.environment.name, sdkConfig.index);

  if (latestBlockhashResponse == null) {
    return null;
  }

  // SolanaClient solanaClient = SolanaClient(rpcUrl: Uri.parse(sdkConfig.solanaRpcEndpoint), websocketUrl: Uri.parse(sdkConfig.solanaWssEndpoint), timeout: timeoutDuration);
  // var recentBlockHash = await solanaClient.rpcClient.getRecentBlockhash();
  // int blockHeight = await solanaClient.rpcClient.getBlockHeight();

  final CompiledMessage compiledMessage = message.compile(
    recentBlockhash: latestBlockhashResponse.blockhash,
    feePayer: hopSignerPublicKey,
  );

  var tx = SignedTx(
    messageBytes: compiledMessage.data,
    signatures: [
      Signature(List.filled(64, 0), publicKey: hopSignerPublicKey),
      await from.sign(compiledMessage.data),
    ],
  );

  String _txe = tx.encode();

  final apiInstance = AccountApi();

  final createAccountRequest = CreateAccountRequest(
    environment: sdkConfig.environment.name,
    index: sdkConfig.index,
    mint: mint,
    referenceId: "DART",
    referenceType: "createAccount",
    tx: _txe,
    commitment: CreateAccountRequestCommitmentEnum.finalized,
    lastValidBlockHeight: latestBlockhashResponse.lastValidBlockHeight,
  );

  Transaction? transaction;
  try {
    transaction = await apiInstance.createAccount(createAccountRequest);
    safePrint(transaction);
  } catch (e) {
    safePrint('Exception when calling AccountApi->createAccount: $e\n');
  }

  return transaction;
}