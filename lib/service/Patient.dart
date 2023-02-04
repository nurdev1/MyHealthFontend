

import 'dart:convert';

import 'package:masante/modeles/Patient.dart';

import '../global/LaisonBankend.dart';
import 'package:http/http.dart' as http;

class PatientService {

  static Future<ModelPatient> ajouterDossier(String nom, String image) async {
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




}

