import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masante/admin/component/DetailDasboard.dart';

import '../AllFile/global/LaisonBankend.dart';
import '../modeles/Hopital.dart';

class HopitalService {


/*

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
  }*/

/////////////////////////////////////////////////////////////////////////
/*  static Future<List<Hopital>> NouveauHopitaux() async {
    final response = await http.get(Uri.parse('$masante/nouveau'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => Hopital.fromJson(e)).toList();
    } else {
      throw Exception('Échec du chargement des hôpitaux');
    }
  }*/
  ///////////////////////////////////////////////////////////////
  var data = [];
  List<Hopital> results = [];

  String fetchUrl ='http://127.0.0.1:8082/hopital/afficher';

  static Future<List<Hopital>> getAllHopital() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Hopital> items = [];
    //String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('http://127.0.0.1:8082/hopital/afficher');
    // var headers = {
    //   "Authorization": "Bearer $token"
    // };
    /*http.Response response = await http.get(url,
      headers: headers,
    );*/

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {

      //get the data from the response
      String jsonString = response.body;
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      //List data = json.decode(jsonString);
      List data = json.decode(utf8.decode(jsonByte));
      //Convert to List<Map>
      print(data);
      //List data = jsonDecode(jsonString);
      items = data.map((e) => Hopital.fromJson(e)).toList();
      print("items");
      print(items);

    }

    return items;


  }

/////////////////////////////////////////////////////////////////:
  var file = [];
  List<Hopital> result = [];


  static Future<List<Hopital>> NouveauHopitaux() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Hopital> items = [];
    //String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('http://127.0.0.1:8082/hopital/nouveau');
    // var headers = {
    //   "Authorization": "Bearer $token"
    // };
    /*http.Response response = await http.get(url,
      headers: headers,
    );*/

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {

      //get the data from the response
      String jsonString = response.body;
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      //List data = json.decode(jsonString);
      List file = json.decode(utf8.decode(jsonByte));
      //Convert to List<Map>
      print(file);
      //List data = jsonDecode(jsonString);
      items = file.map((e) => Hopital.fromJson(e)).toList();
      print("items");
      print(items);

    }

    return items;


  }



}