import 'Dossier.dart';

class ConsultationModele {
  final int idprescription;
  final String nom;
  final String description;
  final String pieceJoint;
  final DateTime date;
  final DossierModele dossier;

  ConsultationModele(this.idprescription, this.nom, this.description,
      this.pieceJoint, this.date, this.dossier);

  factory ConsultationModele.fromMap(Map json) {
    return ConsultationModele(
      json['idprescription'],
      json['nom'],
      json['description'],
      json['pieceJoint'],
      json['date'],
      json['dossier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idprescription': idprescription,
      'nom': nom,
      'description': description,
      'pieceJoint': pieceJoint,
      'date': date,
      'dossier': dossier
    };
  }
}
