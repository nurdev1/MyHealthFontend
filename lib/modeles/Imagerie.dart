import '../admin/component/ListeActivite.dart';

class Imagerie {
  int idimagerie;
  String nom;
  String description;
  String pieceJoint;
  DateTime date;
  Consultation consultation;

  Imagerie(
      {
        required this.idimagerie,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
      required this.consultation});

  factory Imagerie.fromJson(Map<String, dynamic> json) {
   return Imagerie(
       idimagerie : json['idimagerie'],
    nom : json['nom'],
    description : json['description'],
    pieceJoint : json['pieceJoint'],
    date : json['date'],
    consultation : json['consultation']);
  }

  Map<String, dynamic> toJson() {
   return {
      'idimagerie' : idimagerie,
      'nom' : nom,
      'description' : description,
      'pieceJoint' : pieceJoint,
      'date' : date,
      'consultation' : consultation,
    };
  }
}