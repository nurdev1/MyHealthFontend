import 'dart:convert';


import 'package:masante/modeles/Patient.dart';

import '../AllFile/global/LaisonBankend.dart';
import '../modeles/Dossier.dart';
import 'package:http/http.dart' as http;


class DossierService {


  var data = [];
  List<DossierModele> results = [];

  String fetchUrl ='$masante/dossier/afficher';
  Future<List<DossierModele>> getDossierModel({String ,query}) async{

    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);

    try{
      if(response.statusCode == 200){
        // Decoding the response with utf8 and json.decode()
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        results = data.map((e)=> DossierModele.fromJson(e)).toList();

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

  static Future<String> addDossier(String nom, String description) async {
    var url = Uri.parse('$masante/dossier/ajouter');
    final data = jsonEncode(
        {'nom': nom,  'description':description });
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
      return "Problème lors d'ajout ${response.statusCode} ${response.body}";
    }
  }

}