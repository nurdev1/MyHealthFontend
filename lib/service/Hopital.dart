import 'dart:convert';

import 'package:http/http.dart' as http;

class HopitalService {

  static const String api = "http://localhost:8082/hopital";

  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };

  Future<http.Response> get(String url, Map<String, String> params) async {
    try{
      Uri uri = Uri.parse(api+url).replace(queryParameters: params);
      http.Response response = await http.get(uri);
      return response;
    }catch(e){
      return http.Response({"message":e}.toString(),400);
    }
  }

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    try {
      Uri uri = Uri.parse(api + url);
      String bodyString = json.encode(body);
      http.Response response =
      await http.post(uri, headers: headers, body: bodyString);
      return response;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }

  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    try {
      Uri uri = Uri.parse(api + url);
      String bodyString = json.encode(body);
      http.Response response =
      await http.put(uri, headers: headers, body: bodyString);
      return response;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }

  Future<http.Response> delete(String url) async {
    try {
      Uri uri = Uri.parse(api + url);
      http.Response response = await http.delete(uri, headers: headers);
      return response;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }


}