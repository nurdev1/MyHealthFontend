import 'dart:convert';

import '../AllFile/global/LaisonBankend.dart';
import '../modeles/Imagerie.dart';
import 'package:http/http.dart' as http;

class ImagerieService{

  static Future<ImagerieModele> ajouterDossier(String nom, String description,String date, String pieceJoint) async {
    Map data = {
      'nom': nom,
      'description': description,
      'date': date,
      'pieceJoint': pieceJoint,
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
    ImagerieModele imagerieModele = ImagerieModele.fromMap(responseMap);
    return imagerieModele;
  }

//partie get
  static Future<List<ImagerieModele>> getImagerie() async {
    var url = Uri.parse(masante + '/imagerie/liste');
    http.Response response = await http.get(url, headers: headers);


    List responseList = jsonDecode(response.body);
    List<ImagerieModele> imageries = [];
    for (Map imagerieMap in responseList) {
      ImagerieModele imagerieModele = ImagerieModele.fromMap(imagerieMap);
      imageries.add(imagerieModele);
      print("ca marche");
      print(responseList);
      print("ca marche");
    }
    return imageries;

  }


  static Future<http.Response> updateImagerie(int id) async {
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
  }





}