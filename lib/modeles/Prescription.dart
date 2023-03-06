import 'Consultation.dart';

class PrescriptionModele {
  int? id;
  String? nom;
  String? description;
  String? pieceJoint;
  String? date;
  ConsultationModele? consultation;

  PrescriptionModele(
      {this.id,
      this.nom,
      this.description,
      this.pieceJoint,
      this.date,
      this.consultation});

  PrescriptionModele.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    pieceJoint = json['pieceJoint'];
    date = json['date'];
    consultation = json['consultation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nom'] = nom;
    data['description'] = description;
    data['pieceJoint'] = pieceJoint;
    data['date'] = date;
    data['consultation'] = consultation;
    return data;
  }
}
