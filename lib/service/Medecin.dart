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
  /****yhugyutdddddddddikkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk***/

  static Future<List<MedecinModel>> getAllHopital() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    List<MedecinModel> items = [];
    //String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('http://127.0.0.1:8082/medecin/afficher');
    // var headers = {
    //   "Authorization": "Bearer $token"
    // };
    /*http.Response response = await http.get(url,
      headers: headers,
    );*/

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {

      //get the data from the response
      String jsonString = response.body;
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      //List data = json.decode(jsonString);
      List data = json.decode(utf8.decode(jsonByte));
      //Convert to List<Map>
      print(data);
      //List data = jsonDecode(jsonString);
      items = data.map((e) => MedecinModel.fromJson(e)).toList();
      print("items");
      print(items);

    }

    return items;


  }
}



