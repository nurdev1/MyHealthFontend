
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../AllFile/repository/sign_in_repository.dart';
import '../../AllFile/responses/sign_in_response.dart';
import '../base_http_client.dart';
import '../url_paths.dart';

class SignInHttp implements SignInRepository {
  const SignInHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<SignInResponse> signInWithUsernameAndPassword(
    String username,
    String password,
  ) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.signIn,
        request: {
          'username': username,
          'password': password,
        },
      );
      return compute(signInResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }
}
