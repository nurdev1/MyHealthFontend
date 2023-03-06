
import 'CompteRendu.dart';

class SyntheseMedicalModele  {
  int idSyntheseMedical;
  String nom;
  String description;
  String pieceJoint;
  String date;
  CompteRenduModele compteRendu;

  SyntheseMedicalModele (
      {required this.idSyntheseMedical,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
      required this.compteRendu});

  factory SyntheseMedicalModele .fromJson(Map<String, dynamic> json) {
    return SyntheseMedicalModele  (
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