import 'package:masante/modeles/CompteRendu.dart';

import '../admin/component/ListeActivite.dart';

class SoinsModele  {
  int idSoins;
  String nom;
  String description;
  String pieceJoint;
  String date;
  CompteRenduModele compteRendu;

  SoinsModele (
      {required this.idSoins,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
      required this.compteRendu});

  factory SoinsModele.fromJson(Map<String, dynamic> json) {
   return SoinsModele(
       idSoins : json['idSoins'],
    nom : json['nom'],
    description : json['description'],
    pieceJoint : json['pieceJoint'],
    date : json['date'],
    compteRendu : json['compteRendu']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idSoins' : idSoins,
      'nom' : nom,
      'description' : description,
      'pieceJoint' : pieceJoint,
      'date' : date,
      'compteRendu' : compteRendu,
    };
  }
}