import 'Patient.dart';

class DossierModele {
  /*late final String iddossier;
  final String nom;
  final String? date;
  final String patient;

  DossierModele(
  this.iddossier,
   this.nom,
    this.date,
   this.patient
      );

  //collection en objet
  factory DossierModele.fromMap(Map json) {
    return DossierModele(
       json['iddossier'],
       json['nom'],
     json['date'],
      json['patient']
    );
  }
//objet en collection
  Map<String, dynamic> toJson() {
    return {
      'iddossier': iddossier,
      'nom': nom,
      //  'date': date,
      // 'patient': patient
    };
  }*/

   int? iddossier;
   String? nom;
   String? date;
   ModelPatient? patient;

  DossierModele({this.iddossier, this.nom, this.date, this.patient});

  DossierModele.fromJson(Map<String, dynamic> json){
    iddossier= json['iddossier'];
    nom = json['nom'];
    patient = json['patient'] != null ? ModelPatient.fromJson(json['patient']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['iddossier'] = this.iddossier;
    data['nom'] = this.nom;
    if(ModelPatient != null){
      data['Patient'] = ModelPatient().toJson();
    }


    return data;
  }
}
