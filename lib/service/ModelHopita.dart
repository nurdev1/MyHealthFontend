import 'dart:convert';

import 'package:masante/modeles/Hopi.dart';
import 'package:masante/modeles/Hopital.dart';

import '../global/LaisonBankend.dart';
import 'package:http/http.dart' as http;

class ServiceHopital {
  static Future<HopiModel> ajouterHopital(String nom, String image) async {
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
    HopiModel hopiModel = HopiModel.fromMap(responseMap);
    return hopiModel;
  }

  static Future<List<HopiModel>> getPatient() async {
    var url = Uri.parse(masante + '/patient/liste');
    http.Response response = await http.get(url, headers: headers);


    List responseList = jsonDecode(response.body);
    List<HopiModel> modelPatients = [];
    for (Map patientMap in responseList) {
      HopiModel modelPatient = HopiModel.fromMap(patientMap);
      modelPatients.add(modelPatient);
      print("ca marche");
      print(responseList);
      print("ca marche");
    }
    return modelPatients;

  }


}