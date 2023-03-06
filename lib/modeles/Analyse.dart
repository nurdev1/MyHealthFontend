import 'package:masante/admin/component/ListeActivite.dart';

class AnalyseModel {
  int idanalyse;
  String nom;
  String description;
  String pieceJoint;
  String date;
  Consultation consultation;

  AnalyseModel(
      {required this.idanalyse,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
      required this.consultation});

  factory AnalyseModel.fromJson(Map<String, dynamic> json) {
   return AnalyseModel(
       idanalyse : json['idanalyse'],
       nom : json['nom'],
       description : json['description'],
   pieceJoint : json['pieceJoint'],
   date : json['date'],
   consultation : json['consultation'],
   );
  }

  Map<String, dynamic> toJson() {
    return {
    'idanalyse' : idanalyse,
      'nom' : nom,
      'description' : description,
      'pieceJoint' : pieceJoint,
      'date' : date,
     'consultation' : consultation,
    };
  }
}