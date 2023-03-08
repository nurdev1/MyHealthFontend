import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masante/modeles/Patient.dart';

import '../AllFile/global/LaisonBankend.dart';

class PatientService {

  var data = [];
  List<ModelPatient> results = [];

  String fetchUrl = '$masante/patient/afficher';

  Future<List<ModelPatient>> getPatientModel({String, query}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
    };

    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        // Decoding the response with utf8 and json.decode()
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        results = data.map((e) => ModelPatient.fromJson(e)).toList();

        if (query != null) {
          results = results
              .where((element) =>
                  element.nom!.toLowerCase().contains(query.toString()))
              .toList();
        }
      } else {
        print('Erreur lors de la récupération des données');
      }
    } on Exception catch (e) {
      print('Erreur lors de la récupération des données: $e');
    }
    print(results);

    return results;
  }

  static Future<String> addPatient(String nom, String prenom, String username,
      String email, String telephone, String password) async {
    var url = Uri.parse('$masante/patient/signup');
    final data = jsonEncode({
      'nom': Uri.encodeComponent(nom),
      'prenom': Uri.encodeComponent(prenom),
      'username': Uri.encodeComponent(username),
      'email': Uri.encodeComponent(email),
      'telephone': Uri.encodeComponent(telephone),
      'password': Uri.encodeComponent(password)
    });
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

  static Future<List<ModelPatient>> getAllPatient() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ModelPatient> items = [];
    //String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('http://127.0.0.1:8082/patient/afficher');
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
      items = data.map((e) => ModelPatient.fromJson(e)).toList();
      print("items");
      print(items);
    }

    return items;
  }
}


