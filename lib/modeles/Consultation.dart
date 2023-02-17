import 'package:masante/modeles/Patient.dart';

import 'Medecin.dart';

class ConsultationModele {
  int? idconsultation;
  String? titre;
  String? description;
  String? fichier;
  bool? etat;
  DateTime? date;
  MedecinModel? medecin;
  ModelPatient? patient;

  ConsultationModele({
    this.idconsultation,
    this.titre,
    this.description,
    this.fichier,
    this.etat,
    this.date,
    this.medecin,
    this.patient,
  });

  factory ConsultationModele.fromJson(Map<String, dynamic> json) {
    return ConsultationModele(
      idconsultation: json['idconsultation'],
      titre: json['titre'],
      description: json['desciption'],
      fichier: json['fichier'],
      etat: json['etat'],
      date: DateTime.parse(json['date']),
      medecin: MedecinModel.fromJson(json['medecin']),
      patient: ModelPatient.fromJson(json['patient']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
     data ['idconsultation']= idconsultation;
     data ['titre']= titre;
    data['description']= description;
    data['fichier']= fichier;
    data['etat']= etat;
    data['date']= date;
     if(MedecinModel != null) {
       data['medecin']= MedecinModel().toJson();
    }
     if(ModelPatient != null) {
    data['patient'] = ModelPatient().toJson();
      }
    return data;
  }
}

