import '../admin/component/ListeActivite.dart';
import 'Consultation.dart';

class ImagerieModele  {
  final int idimagerie;
  final String nom;
  final String description;
  final String pieceJoint;
  final DateTime date;
  final ConsultationModele  consultation;

  ImagerieModele (
         this.idimagerie,
       this.nom,
       this.description,
       this.pieceJoint,
       this.date,
       this.consultation
  );

  factory ImagerieModele .fromMap(Map json) {
   return ImagerieModele (
        json['idimagerie'],
     json['nom'],
    json['description'],
    json['pieceJoint'],
    json['date'],
    json['consultation']);
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