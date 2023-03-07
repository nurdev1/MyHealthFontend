import 'dart:convert';


import '../AllFile/global/LaisonBankend.dart';
import '../modeles/Dossier.dart';
import 'package:http/http.dart' as http;


class DossierService {
/*  static Future<DossierModele> ajouterDossier(String nom,
      String patient) async {
    Map data = {
      'nom': nom,
      'patient': patient,
    };
    var body = json.encode(data);
    var url = Uri.parse(masante + '/dossier/ajouter');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    DossierModele dossierModele = DossierModele.fromMap(responseMap);
    return dossierModele;
  }

//partie get
  static Future<List<DossierModele>> getPatient() async {
    var url = Uri.parse(masante + '/dossier/liste');
    http.Response response = await http.get(url, headers: headers);


    List responseList = jsonDecode(response.body);
    List<DossierModele> dossierModeles = [];
    for (Map dossierMap in responseList) {
      DossierModele dossierModele = DossierModele.fromMap(dossierMap);
      dossierModeles.add(dossierModele);
      print("ca marche");
      print(responseList);
      print("ca marche");
    }
    return dossierModeles;
  }


  static Future<http.Response> updateDossier(int id) async {
    var url = Uri.parse(masante + '/dossier/modifier/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deleteDossier(int id) async {
    var url = Uri.parse(masante + '/dossier/supprimer/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }*/

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

  static Future<String> addDossier(String nom, String email, String prenom, String telephone,String password) async {
    var url = Uri.parse('$masante/dossier/ajouter');
    final data = jsonEncode(
        {'nom': nom, 'email': email, 'prenom': prenom, 'telephone':telephone,'motdepasse':password });
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