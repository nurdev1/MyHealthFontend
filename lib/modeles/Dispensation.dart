import 'package:masante/admin/component/ListeActivite.dart';

class Dispensation {
  int idDispensation;
  String nom;
  String description;
  String pieceJoint;
  DateTime date;
  Consultation consultation;

  Dispensation(
      {
        required this.idDispensation,
        required this.nom,
        required this.description,
        required this.pieceJoint,
       required this.date,
       required this.consultation});

  factory Dispensation.fromJson(Map<String, dynamic> json) {
   return Dispensation(
       idDispensation : json['idDispensation'],
       nom : json['nom'],
       description : json['description'],
       pieceJoint : json['pieceJoint'],
       date : json['date'],
       consultation : json['consultation'],
            );
  }

  Map<String, dynamic> toJson() {
    return {
    'idDispensation' : idDispensation,
    'nom' : nom,
    'description' :description,
    'pieceJoint' : pieceJoint,
    'date' : date,
    'consultation' : consultation,

    };

  }
}