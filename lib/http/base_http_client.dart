import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:masante/http/url_paths.dart';

import '../exceptions/http_exceptions.dart';
import '../local/secure_storage_local.dart';

class BaseHttpClient {
  const BaseHttpClient({
    this.timeout = const Duration(seconds: 10),
    this.secureStorageLocal = const SecureStorageLocal(),
  });

  final Duration timeout;
  final SecureStorageLocal secureStorageLocal;

  Future<http.Response> get(
    String path, [
    Map<String, String>? parameters,
  ]) async {
    final Uri uri = parameters == null
        ? Uri.parse('${UrlPaths.url}$path')
        : Uri.http('http://localhost:8082', '/api/auth/signin$path', parameters);
    try {
      final String? token = await secureStorageLocal.jwtToken;
      final http.Response response = await http.get(
        uri,
        headers: {HttpHeaders.authorizationHeader: token ?? ''},
      ).timeout(timeout);
      if (response.statusCode == 200) {
        return Future.value(response);
      }
      throw _processResponse(
        response.statusCode,
        response.request?.url.toString() ?? uri.toString(),
      );
    } on SocketException {
      throw FetchDataException("Pas de connexion Internet", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("Temps libre", uri.toString());
    }
  }
//--------------------------Post-------------------
  Future<http.Response> post(
    String path, {
    Map<String, dynamic>? request,
    Map<String, String>? parameters,
  }) async {
    final Uri uri = parameters == null
        ? Uri.parse('${UrlPaths.url}$path')
        : Uri.http('http://localhost:8082', path, parameters);
    //Uri.http('http://localhost:8082', '/api/v1$path', parameters);
    try {
      final String? token = await secureStorageLocal.jwtToken;
      final http.Response response = await http
          .post(
            uri,
            headers: path == UrlPaths.signIn
                ? null
                : {
                    HttpHeaders.authorizationHeader: token ?? '',
                    'Content-Type': 'application/json',
                  },
            body: request != null ? json.encode(request) : null,
          )
          .timeout(timeout);
      if (response.statusCode == 200) {
        return Future.value(response);
      }
      throw _processResponse(
        response.statusCode,
        response.request?.url.toString() ?? uri.toString(),
        response.reasonPhrase,
      );
    } on SocketException {
      throw FetchDataException("Pas de connexion Internet", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("Temps libre", uri.toString());
    }
  }

  Exception _processResponse(int statusCode, String url, [String? message]) {
    switch (statusCode) {
      case 400:
        return BadRequestException(
          message ?? "Vérifier la demande envoyée au serveur",
          url,
        );
      case 401:
        return UnauthorizedException(
          message ?? "Vos identifiants sont incorrects",
          url,
        );
      case 403:
        return UnauthorizedException(
          message ?? "Vous n'avez pas d'autorisation",
          url,
        );
      default:
        return FetchDataException(
          message ?? "Une erreur s'est produite avec le code: $statusCode",
          url,
        );
    }
  }
}
