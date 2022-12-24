//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AccountApi {
  AccountApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CloseAccountRequest] closeAccountRequest (required):
  Future<Response> closeAccountWithHttpInfo(CloseAccountRequest closeAccountRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/account/close';

    // ignore: prefer_final_locals
    Object? postBody = closeAccountRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [CloseAccountRequest] closeAccountRequest (required):
  Future<Transaction?> closeAccount(CloseAccountRequest closeAccountRequest,) async {
    final response = await closeAccountWithHttpInfo(closeAccountRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Transaction',) as Transaction;
    
    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateAccountRequest] createAccountRequest (required):
  Future<Response> createAccountWithHttpInfo(CreateAccountRequest createAccountRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/account/create';

    // ignore: prefer_final_locals
    Object? postBody = createAccountRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [CreateAccountRequest] createAccountRequest (required):
  Future<Transaction?> createAccount(CreateAccountRequest createAccountRequest,) async {
    final response = await createAccountWithHttpInfo(createAccountRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Transaction',) as Transaction;
    
    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [String] mint (required):
  ///
  /// * [Commitment] commitment (required):
  Future<Response> getAccountInfoWithHttpInfo(String environment, int index, String accountId, String mint, Commitment commitment,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/account/info/{environment}/{index}/{accountId}/{mint}'
      .replaceAll('{environment}', environment)
      .replaceAll('{index}', index.toString())
      .replaceAll('{accountId}', accountId)
      .replaceAll('{mint}', mint);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'commitment', commitment));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [String] mint (required):
  ///
  /// * [Commitment] commitment (required):
  Future<AccountInfo?> getAccountInfo(String environment, int index, String accountId, String mint, Commitment commitment,) async {
    final response = await getAccountInfoWithHttpInfo(environment, index, accountId, mint, commitment,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AccountInfo',) as AccountInfo;
    
    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [Commitment] commitment (required):
  Future<Response> getBalanceWithHttpInfo(String environment, int index, String accountId, Commitment commitment,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/account/balance/{environment}/{index}/{accountId}'
      .replaceAll('{environment}', environment)
      .replaceAll('{index}', index.toString())
      .replaceAll('{accountId}', accountId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'commitment', commitment));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [Commitment] commitment (required):
  Future<BalanceResponse?> getBalance(String environment, int index, String accountId, Commitment commitment,) async {
    final response = await getBalanceWithHttpInfo(environment, index, accountId, commitment,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BalanceResponse',) as BalanceResponse;
    
    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [String] mint (required):
  ///
  /// * [Commitment] commitment (required):
  Future<Response> getHistoryWithHttpInfo(String environment, int index, String accountId, String mint, Commitment commitment,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/account/history/{environment}/{index}/{accountId}/{mint}'
      .replaceAll('{environment}', environment)
      .replaceAll('{index}', index.toString())
      .replaceAll('{accountId}', accountId)
      .replaceAll('{mint}', mint);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'commitment', commitment));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [String] mint (required):
  ///
  /// * [Commitment] commitment (required):
  Future<List<HistoryResponse>?> getHistory(String environment, int index, String accountId, String mint, Commitment commitment,) async {
    final response = await getHistoryWithHttpInfo(environment, index, accountId, mint, commitment,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<HistoryResponse>') as List)
        .cast<HistoryResponse>()
        .toList();

    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [String] mint (required):
  ///
  /// * [Commitment] commitment (required):
  Future<Response> getTokenAccountsWithHttpInfo(String environment, int index, String accountId, String mint, Commitment commitment,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/account/token-accounts/{environment}/{index}/{accountId}/{mint}'
      .replaceAll('{environment}', environment)
      .replaceAll('{index}', index.toString())
      .replaceAll('{accountId}', accountId)
      .replaceAll('{mint}', mint);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'commitment', commitment));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] accountId (required):
  ///
  /// * [String] mint (required):
  ///
  /// * [Commitment] commitment (required):
  Future<List<String>?> getTokenAccounts(String environment, int index, String accountId, String mint, Commitment commitment,) async {
    final response = await getTokenAccountsWithHttpInfo(environment, index, accountId, mint, commitment,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<String>') as List)
        .cast<String>()
        .toList();

    }
    return null;
  }
}
