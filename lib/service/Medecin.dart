import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:masante/modeles/Patient.dart';

import '../AllFile/global/LaisonBankend.dart';
import '../modeles/Medecin.dart';
class MedecinService{


  var data = [];
  List<MedecinModel> results = [];

  String fetchUrl ='$masante/medecin/afficher';
  Future<List<MedecinModel>> getMedecinModel({String ,query}) async{

    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);

try{
  if(response.statusCode == 200){
    data = json.decode(response.body);
    results = data.map((e)=> MedecinModel.fromJson(e)).toList();

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

  static Future<String> addMedecin(String nom, String email, String prenom, String telephone,String password, String username, String specialite) async {
    var url = Uri.parse('$masante/medecin/save');
    final data = jsonEncode(
        {'nom': nom,  'prenom': prenom, 'telephone':telephone,'password':password,'specialite':specialite,'username':username,'email': email });
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
}



