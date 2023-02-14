import 'package:masante/admin/component/ListeActivite.dart';
import 'package:masante/modeles/Consultation.dart';

class DispensationModele  {
  final int idDispensation;
  final String nom;
  final String description;
  final String pieceJoint;
  final DateTime date;
  final ConsultationModele consultation;

  DispensationModele(

         this.idDispensation,
         this.nom,
         this.description,
         this.pieceJoint,
        this.date,
        this.consultation);

  factory DispensationModele.fromMap(Map json){
   return DispensationModele(
       json['idDispensation'],
       json['nom'],
        json['description'],
       json['pieceJoint'],
       json['date'],
        json['consultation'],
            );
  }

  Map<String, dynamic> toJson() {
    return {
    'idDispensation' : idDispensation,
    'nom' : nom,
    'description' :description,
    'pieceJoint' : pieceJoint,
    'date' : date,
    'consultation' : consultation,

    };

  }
}