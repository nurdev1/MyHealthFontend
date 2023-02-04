import 'package:masante/admin/component/ListeActivite.dart';

class Prescription {
  int idprescription;
  String nom;
  String description;
  String pieceJoint;
  String date;
  Consultation consultation;

  Prescription(
      {required this.idprescription,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
      required this.consultation});

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      idprescription: json['idprescription'],
      nom: json['nom'],
      description: json['description'],
      pieceJoint: json['pieceJoint'],
      date: json['date'],
      consultation: json['consultation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idprescription': idprescription,
      'nom': nom,
      'description': description,
      'pieceJoint': pieceJoint,
      'date': date,
      'consultation': consultation,
    };
  }
}
