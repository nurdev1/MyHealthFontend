import 'package:masante/admin/component/ListeActivite.dart';

import 'Consultation.dart';

class PrescriptionModele  {
  int idprescription;
  final String nom;
  final String description;
  final String pieceJoint;
  final String date;
  final ConsultationModele  consultation;

  PrescriptionModele (
       this.idprescription,
       this.nom,
       this.description,
       this.pieceJoint,
       this.date,
       this.consultation
      );

  factory PrescriptionModele .fromMap(Map json) {
    return PrescriptionModele (
    json['idprescription'],
      json['nom'],
       json['description'],
       json['pieceJoint'],
      json['date'],
       json['consultation'],
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
