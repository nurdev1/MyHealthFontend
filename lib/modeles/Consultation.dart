import 'Dossier.dart';

class Consultation {
  int idprescription;
  String nom;
  String description;
  String pieceJoint;
  DateTime date;
  Dossier dossier;

  Consultation(
      {
        required this.idprescription,
        required this.nom,
     required this.description,
     required this.pieceJoint,
     required this.date,
     required this.dossier});

 factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      idprescription : json['idprescription'],
      nom : json['nom'],
      description : json['description'],
      pieceJoint : json['pieceJoint'],
      date : json['date'],
      dossier : json['dossier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    'idprescription' : idprescription,
    'nom' : nom,
    'description' : description,
    'pieceJoint' : pieceJoint,
    'date' : date,
   'dossier' : dossier
    };
  }
}