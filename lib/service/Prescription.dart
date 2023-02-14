import 'dart:convert';

import 'package:masante/modeles/Prescription.dart';


import 'package:http/http.dart' as http;

import '../AllFile/global/LaisonBankend.dart';

class PrescriptionService{

  static Future<PrescriptionModele> ajouterPrescription(String nom, String image) async {
    Map data = {
      'nom': nom,
      'image': image,
    };
    var body = json.encode(data);
    var url = Uri.parse(masante + '/prescription/ajouter');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    PrescriptionModele prescriptionModele = PrescriptionModele.fromMap(responseMap);
    return prescriptionModele;
  }

//partie get
  static Future<List<PrescriptionModele>> getPrescription() async {
    var url = Uri.parse(masante + '/prescription/liste');
    http.Response response = await http.get(url, headers: headers);


    List responseList = jsonDecode(response.body);
    List<PrescriptionModele> prescriptions = [];
    for (Map patientMap in responseList) {
      PrescriptionModele prescriptionModele = PrescriptionModele.fromMap(patientMap);
      prescriptions.add(prescriptionModele);
      print("ca marche");
      print(responseList);
      print("ca marche");
    }
    return prescriptions;

  }


  static Future<http.Response> updatePrescription(int id) async {
    var url = Uri.parse(masante + '/prescription/modifier/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deletePrescription(int id) async {
    var url = Uri.parse(masante + '/prescription/supprimer/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }




}