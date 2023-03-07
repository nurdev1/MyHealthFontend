import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:masante/modeles/Consultation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ConsultationService{

  Future<http.Response> ajouterConsultation(String titre, String description, String fichier, int idMedecin, int idPatient) async {
    final response = await http.post(
      Uri.parse('$masante+/consultation/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'titre': titre,
        'description': description,
        'fichier': fichier,
        'idMedecin': idMedecin,
        'idPatient': idPatient,
      }),
    );
    return response;
  }

  Future<ConsultationModele> ajouterConsultation1(ConsultationModele consultation) async {
    final response = await http.post(
      Uri.parse('$masante+/consultations/ajouter'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(consultation.toJson()),
    );

    if (response.statusCode == 201) {
      return ConsultationModele.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Impossible d\'ajouter la consultation.');
    }
  }


  var data = [];
  List<ConsultationModele> results = [];

  String fetchUrl ='$masante/consultation/patient/{id}';
  Future<List<ConsultationModele>> getConsultation({String ,query}) async{

    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);

    try{
      if(response.statusCode == 200){
        // Decoding the response with utf8 and json.decode()
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        results = data.map((e)=> ConsultationModele.fromJson(e)).toList();

        if(query != null){
          results = results.where((element) => element.description!.toLowerCase().contains(query.toString())).toList();
        }
      }else{
        print('Api error');
      }
    }on Exception catch(e){
      print('Error: $e');
    }

    return results;
  }
//////////////////////////////////////////////////////////
  //ADD CONSULTATION
  /*Future<String> addSession(int idmedecin, int idpatient) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? connecteduserid = prefs.getInt("id");
    String? token = prefs.getString("token");
    var url = Uri.parse('$masante/quiz/score/add/$idQuiz/$connecteduserid');
    final data = jsonEncode(
        {
          'points' : point
        });
    var headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };
    var response = await client.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      connexion = true;
      return json['points'].toString();
    } else {
      //throw ("Can't get the Articles");
      return "Score non ajouté ${response.statusCode} ${response.body} !";
    }
  }*/


}