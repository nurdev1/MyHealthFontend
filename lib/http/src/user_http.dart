
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../AllFile/repository/user_repository.dart';
import '../../AllFile/responses/user_response.dart';
import '../base_http_client.dart';
import '../url_paths.dart';

class UserHttp implements UserRepository {
  const UserHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<UserResponse> get user async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.getUser,
      );
      return compute(userResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }
}
