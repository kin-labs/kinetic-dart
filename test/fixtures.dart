import 'package:kinetic/keypair.dart';
import 'package:solana/solana.dart';

Future<Ed25519HDKeyPair> getAliceKeypair() async {
  return await Keypair().fromByteArray([
    205,
    213,
    7,
    246,
    167,
    206,
    37,
    209,
    161,
    129,
    168,
    160,
    90,
    103,
    198,
    142,
    83,
    177,
    214,
    203,
    80,
    29,
    71,
    245,
    56,
    152,
    15,
    8,
    235,
    174,
    62,
    79,
    138,
    198,
    145,
    111,
    119,
    33,
    15,
    237,
    89,
    201,
    122,
    89,
    48,
    221,
    224,
    71,
    81,
    128,
    45,
    97,
    191,
    105,
    37,
    228,
    243,
    238,
    130,
    151,
    53,
    221,
    172,
    125
  ]);
}
