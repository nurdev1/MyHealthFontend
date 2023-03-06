import 'dart:convert';


import 'package:http/http.dart' as http;

import '../AllFile/global/LaisonBankend.dart';
import '../modeles/Imagerie.dart';

class ImagerieService{


  var data = [];
  List<ImagerieModele> results = [];

  String fetchUrl ='$masante/imagerie/afficher';
  Future<List<ImagerieModele>> getPatientModel({String ,query}) async{
    final headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
    };

    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);

    try{
      if(response.statusCode == 200){
        data = json.decode(response.body);
        results = data.map((e)=> ImagerieModele.fromJson(e)).toList();

        if(query != null){
          results = results.where((element) => element.nom!.toLowerCase().contains(query.toString())).toList();
        }
      }else{
        print('Erreur lors de la récupération des données');
      }
    }on Exception catch(e){
      print('Erreur lors de la récupération des données: $e');
    }
    print(results);

    return results;
  }

  static Future<String> addImagerie(String nom, String prenom,String username,String email, String telephone,String password) async {
    var url = Uri.parse('$masante/imagerie/ajouter');
    final data = jsonEncode(
        {'nom': nom,  'prenom': prenom, 'username':username,'email': email, 'telephone':telephone,'password':password });
    print(data);
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http.post(url, body: data, headers: headers);

    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      // connexion = true;
      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de l'inscription ${response.statusCode} ${response.body}";
    }
  }

  static Future<List<ImagerieModele>> getAllImagerie() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ImagerieModele> items = [];
    //String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('http://127.0.0.1:8082/imagerie/afficher');
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
      items = data.map((e) => ImagerieModele.fromJson(e)).toList();
      print("items");
      print(items);

    }

    return items;


  }

/*  static Future<http.Response> updateImagerie(int id) async {
    var url = Uri.parse(masante + '/imagerie/modifier/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deleteImagerie(int id) async {
    var url = Uri.parse(masante + '/imagerie/supprimer/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }*/





}