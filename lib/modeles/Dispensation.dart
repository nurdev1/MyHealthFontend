import 'package:masante/admin/component/ListeActivite.dart';
import 'package:masante/modeles/Consultation.dart';

class DispensationModele  {
   int? id;
   String? nom;
   String? description;
   String? pieceJoint;
   DateTime? date;
   ConsultationModele? consultation;

  DispensationModele(
      {this.id,
      this.nom,
      this.description,
      this.pieceJoint,
      this.date,
      this.consultation});

   DispensationModele.fromJson(Map<String, dynamic> json){

    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    pieceJoint = json['pieceJoint'];
    date = json['date'];
    //dossier = json['dossier'];
  }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data =  Map<String, dynamic>();
    data['idDispensation'] = id;
    data['nom'] = nom;
    data['description'] =description;
    data['pieceJoint'] = pieceJoint;
   data ['date'] = date;
   data [']consultation'] = consultation;

    return data;

  }
}