import 'Dossier.dart';

class CompteRenduModele {

  int? idCompteRendu;
  String? nom;
  String? description;
  String? pieceJoint;
  DateTime? date;
  //DossierModele dossier;

  CompteRenduModele(
      { this.idCompteRendu,
       this.nom,
       this.description,
       this.pieceJoint,
       this.date,
    //  this.dossier
      });

    CompteRenduModele.fromJson(Map<String, dynamic> json){

      idCompteRendu = json['idprescription'];
      nom = json['nom'];
      description = json['description'];
  pieceJoint = json['pieceJoint'];
  date = json['date'];
  //dossier = json['dossier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
 data['idprescription'] = idCompteRendu;
 data['nom'] = nom;
data ['description'] = description;
 data['pieceJoint'] = pieceJoint;
data['date' ]= date;
//data['dossier'] = dossier;

return data;
  }
}