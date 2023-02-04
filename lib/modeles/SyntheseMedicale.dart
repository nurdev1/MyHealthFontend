
import 'CompteRendu.dart';

class SyntheseMedical {
  int idSyntheseMedical;
  String nom;
  String description;
  String pieceJoint;
  String date;
  CompteRendu compteRendu;

  SyntheseMedical(
      {required this.idSyntheseMedical,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
      required this.compteRendu});

  factory SyntheseMedical.fromJson(Map<String, dynamic> json) {
    return SyntheseMedical (
        idSyntheseMedical : json['idprescription'],
    nom : json['nom'],
    description : json['description'],
    pieceJoint : json['pieceJoint'],
    date : json['date'],
    compteRendu : json['compteRendu']);
  }

  Map<String, dynamic> toJson() {
    return
    {
      'idSyntheseMedical' : idSyntheseMedical,
      'nom' : nom,
      'description' : description,
      'pieceJoint' : pieceJoint,
      'date' : date,
      'compteRendu' : compteRendu,
    };
  }
}