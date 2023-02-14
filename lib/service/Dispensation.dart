 import 'dart:convert';

import 'package:masante/modeles/Dispensation.dart';
import 'package:http/http.dart' as http;

import '../AllFile/global/LaisonBankend.dart';

class DispensationService{

  static Future<DispensationModele> addDispensation() async {

    var body = json.encoder;
    var url = Uri.parse(masante + '/dispensation/ajouter');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    DispensationModele dispensationModele = DispensationModele.fromMap(responseMap);

    return dispensationModele;
  }

  static Future<List<DispensationModele>> getDispensation() async {
    var url = Uri.parse(masante);
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<DispensationModele> dispensations = [];
    for (Map patientMap in responseList) {
      DispensationModele dispensationModele = DispensationModele.fromMap(patientMap);
      dispensations.add(dispensationModele);
    }
    return dispensations;
  }

  static Future<http.Response> updatePatient(int id) async {
    var url = Uri.parse(masante + '/dispensation/modifier/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deletePatient(int id) async {
    var url = Uri.parse(masante + '/dispensation/supprimer/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

}