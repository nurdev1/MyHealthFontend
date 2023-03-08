import 'Patient.dart';

class DossierModele {


   int? id;
   String? nom;
   String? description;
   ModelPatient? patient;

  DossierModele({this.id, this.nom, this.description, this.patient});

  DossierModele.fromJson(Map<String, dynamic> json){
    id= json['id'];
    nom = json['nom'];
    description=json['description'];
    patient = json['patient'] != null ? ModelPatient.fromJson(json['patient']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['description']=this.description;
    if(ModelPatient != null){
      data['Patient'] = ModelPatient().toJson();
    }


    return data;
  }
}
