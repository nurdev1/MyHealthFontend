

import 'dart:convert';

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


}

