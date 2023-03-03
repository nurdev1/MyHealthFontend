
import 'dart:convert';

import 'package:masante/modeles/Hopital.dart';


class MedecinModel {
  int? idmedecin;
  String? nom;
  String? prenom;
  String? photo;
  String? telephone;
  String? email;
  String? ville;
  String? adresse;
  String? diplome;
  String? specialite;
  bool? etat;
  Hopital? hopital;
  String? password;
  String? username;
  DateTime? date;



  MedecinModel(
      {this.idmedecin,
        this.nom,
        this.prenom,
        this.photo,
        this.telephone,
        this.email,
        this.ville,
        this.adresse,
        this.diplome,
        this.specialite,
        this.etat,
        this.hopital,
        this.date,
        this.password,
        this.username
        });
  MedecinModel.fromJson(Map<String, dynamic> json){
    idmedecin= json['idmedecin'];
    nom = json['nom'];
    prenom = json['prenom'];
    photo = json['photo'];
    telephone = json['telephone'];
    email = json['email'];
    ville = json['ville'];
    adresse = json['adresse'];
    diplome = json['diplome'];
    specialite = json['specialite'];
    etat = json['etat'];
    password=json['password'];
    username=json['username'];
    date: DateTime.parse(json['date']);
    hopital = json['hopital'] != null ? Hopital.fromJson(json['hopital']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['idmedecin'] = this.idmedecin;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['photo'] = this.photo;
    data['telehone'] = this.telephone;
    data['email'] = this.email;
    data['ville'] = this.ville;
    data['adresse'] = this.adresse;
    data['diplome'] = this.diplome;
    data['specialite'] = this.specialite;
    data['etat'] = this.etat;
    data['password']=this.password;
    data['username']=this.username;
    data['date']= date;
if(Hopital != null){
  data['Hopital'] = Hopital().toJson();
}


    return data;
  }
}







