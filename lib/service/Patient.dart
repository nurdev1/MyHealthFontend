

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masante/modeles/Patient.dart';

import '../AllFile/global/LaisonBankend.dart';
import 'package:http/http.dart' as http;

class PatientService {



  /*static Future<ModelPatient> ajouterDossier(String nom, String image) async {
    Map data = {
      'nom': nom,
      'image': image,
    };
    var body = json.encode(data);
    var url = Uri.parse(masante + '/patient/ajouter');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    ModelPatient modelPatient = ModelPatient.fromMap(responseMap);
    return modelPatient;
  }

//partie get
  static Future<List<ModelPatient>> getPatient() async {
    var url = Uri.parse(masante + '/patient/liste');
    http.Response response = await http.get(url, headers: headers);


    List responseList = jsonDecode(response.body);
    List<ModelPatient> modelPatients = [];
    for (Map patientMap in responseList) {
      ModelPatient modelPatient = ModelPatient.fromMap(patientMap);
      modelPatients.add(modelPatient);
      print("ca marche");
      print(responseList);
      print("ca marche");
    }
    return modelPatients;

  }


  static Future<http.Response> updatePatient(int id) async {
    var url = Uri.parse(masante + '/patient/modifier/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deletePatient(int id) async {
    var url = Uri.parse(masante + '/patient/supprimer/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  //nombre patient
  static Future<List<ModelPatient>> getPatientNombre() async {
    var url = Uri.parse(masante + '/patient/compte');
    http.Response response = await http.get(url, headers: headers);


    List responseList = jsonDecode(response.body);
    List<ModelPatient> modelPatients = [];
    for (Map patientMap in responseList) {
      ModelPatient modelPatient = ModelPatient.fromMap(patientMap);
      modelPatients.add(modelPatient);
      print("ca marche");
      print(responseList);
      print("ca marche");
    }
    return modelPatients;

  }

*/

  var data = [];
  List<ModelPatient> results = [];

  String fetchUrl ='$masante/patient/afficher';
  Future<List<ModelPatient>> getPatientModel({String ,query}) async{
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
        results = data.map((e)=> ModelPatient.fromJson(e)).toList();

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

  static Future<String> addPatient(String nom, String prenom,String username,String email, String telephone,String password) async {
    var url = Uri.parse('$masante/patient/signup');
    final data = jsonEncode(
        {'nom': nom, 'email': email, 'prenom': prenom, 'telephone':telephone,'password':password,'username':username });
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


/*
Future<void> fetchData() async {
  final url = 'https://example.com/data';
  final headers = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
  };

  try {
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      // Traitement des données de réponse
    } else {
      print('Erreur lors de la récupération des données: ${response.statusCode}');
    }
  } catch (e) {
    print('Erreur lors de la récupération des données: $e');
  }
}





*/
