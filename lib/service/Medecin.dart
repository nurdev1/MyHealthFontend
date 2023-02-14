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





/*
  static const String api = "http:/host:8082/hopital";

  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };*/

  // ===== methode pour l'ajout des contact de l'utilisateur =========================
/*  static Future<MedecinModele> addMedecin(String nom, String prenom, String email, String numero, String motdepasse, String specialite) async{
    Map data = {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "numero": numero,
      "motdepasse": motdepasse,
      "specialite":specialite
    };

    var body = json.encode(data);
    var url = Uri.parse(masante + "/medecin/ajouter");

    http.Response response = await http.post(url,
        headers: headers,
        body: body
    );
    Map responseMap = jsonDecode(response.body);

    MedecinModele medecinModele = MedecinModele.fromMap(responseMap);
    print('c moi');
    return medecinModele;
  }*/






  //pour la methode get des medecin de l'hôpital
/*  static Future<List<MedecinModele>> getMedecinParHopital(int id) async{
    var url = Uri.parse(masante + '/medecin/afficher/$id');
    http.Response response = await http.get(url,
      headers: headers,
    );

    List responseList = jsonDecode(response.body);
    List<MedecinModele> medecins = [];
    for (Map contactMap in responseList){
      MedecinModele medecinModele = MedecinModele.fromMap(contactMap);
      medecins.add(medecinModele);
    }

    return medecins;
  }*/

/*



  //======= methode pour effacer les medecin =======
  static Future<http.Response> deleteContact(int id) async {
    var url = Uri.parse(masante + '/supprimer/delete/$id');
    print(id);

    http.Response response = await http.delete(url,
      headers: headers,
    );
    return response;
  }

  //================== recuperation de la liste des medecin ===========
  static Future<List<MedecinModel>> getMedecin() async {
    var url = Uri.parse('$masante/medecin/afficher');
    Response res = await get(url);
    /*http.Response  response = await http.get(url,
      headers: headers,);*/
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      //List<dynamic> body = json['data'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<MedecinModel> medecins =
      json['data'].map((dynamic item) => MedecinModel.fromJson(item)).toList();

      return medecins;
    } else {
      throw ("Il y a pas de liste");
    }

  }*/

}
