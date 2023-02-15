

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
        print('Api error');
      }
    }on Exception catch(e){
      print('Error: $e');
    }

    return results;
  }

/*  Future<ModelPatient> registerPatient(
      String nom, String prenom, String telephone, String email, BuildContext context) async {
    String fetchUrl ='$masante/patient/ajouter';
    var url = Uri.parse(fetchUrl);
    var response = await http.post(url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "nom": nom,
          "prenom": prenom,
          "telephone": telephone,
          "email": email,
        }));


  }*/
  static Future<String> addPatient(String nom, String email, String prenom, String telephone) async {
    var url = Uri.parse('$masante/patient/ajouter');
    final data = jsonEncode(
        {'nom': nom, 'email': email, 'prenom': prenom, 'telephone':telephone});
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
     // connexion = true;
      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de l'inscription ${response.statusCode} ${response.body}";
    }
  }
  }





