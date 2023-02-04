import 'Dossier.dart';

class CompteRendu{

  int idCompteRendu;
  String nom;
  String description;
  String pieceJoint;
  DateTime date;
  Dossier dossier;

  CompteRendu(
      {required this.idCompteRendu,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
     required this.dossier
      });

   factory CompteRendu.fromJson(Map<String, dynamic> json) {
  return CompteRendu(
      idCompteRendu : json['idprescription'],
      nom : json['nom'],
      description : json['description'],
  pieceJoint : json['pieceJoint'],
  date : json['date'],
  dossier : json['dossier'],
  );
  }

  Map<String, dynamic> toJson() {
 return {
 'idprescription' : idCompteRendu,
 'nom' : nom,
 'description' : description,
 'pieceJoint' : pieceJoint,
 'date' : date,
 'dossier' : dossier,
 };

  }
}