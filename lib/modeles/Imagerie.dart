import 'Consultation.dart';

class ImagerieModele {
  int? id;
  String? nom;
  String? description;
  String? pieceJoint;
  DateTime? date;
  ConsultationModele? consultation;

  ImagerieModele(
      {this.id,
      this.nom,
      this.description,
      this.pieceJoint,
      this.date,
      this.consultation});

  ImagerieModele.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    pieceJoint = json['pieceJoint'];
    date = json['date'];
    json['consultation'];
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
