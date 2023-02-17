import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:masante/modeles/Consultation.dart';
class ConsultationService{

  Future<http.Response> ajouterConsultation(String titre, String description, String fichier, int idMedecin, int idPatient) async {
    final response = await http.post(
      Uri.parse('$masante+/consultations/ajouter'),
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



}