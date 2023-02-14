import 'Dossier.dart';

class CompteRenduModele {

  int idCompteRendu;
  String nom;
  String description;
  String pieceJoint;
  DateTime date;
  DossierModele dossier;

  CompteRenduModele(
      {required this.idCompteRendu,
      required this.nom,
      required this.description,
      required this.pieceJoint,
      required this.date,
     required this.dossier
      });

   factory CompteRenduModele.fromJson(Map<String, dynamic> json) {
  return CompteRenduModele(
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