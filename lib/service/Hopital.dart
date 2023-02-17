import 'dart:convert';

import 'package:http/http.dart' as http;

import '../AllFile/global/LaisonBankend.dart';
import '../modeles/Hopital.dart';
import '../modeles/hopitalModel.dart';

class HopitalService {


/*  Map<String, String> headers = {
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
  }*/
  static const String _baseURL = '$masante+medecin/'; // Mettez l'URL de votre API REST ici

  static Future<List<Hopital>> fetchHopitaux() async {
    final response = await http.get(Uri.parse('$_baseURL/hopitaux'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => Hopital.fromJson(e)).toList();
    } else {
      throw Exception('Échec du chargement des hôpitaux');
    }
  }

  var data = [];
  List<HopitalsModel> results = [];

  String fetchUrl ='$masante/hopital/afficher';
  Future<List<HopitalsModel>> getHopitalModel({String ,query}) async{

    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);

    try{
      if(response.statusCode == 200){
        data = json.decode(response.body);
        results = data.map((e)=> HopitalsModel.fromJson(e)).toList();

        if(query != null){
          results = results.where((element) => element.nom!.toLowerCase().contains(query.toString())).toList();
        }
      }else{
        print('Api error');
      }
    }on Exception catch(e){
      print('Error: $e');
    }

    return results;
  }




}