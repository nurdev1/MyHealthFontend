/*class MedecinModele {
  final int id;
  final String username;
  final String email;
  final String adresse;
  final String numero;
  final String password;
  final String nom;
  final String specialite;
  final String photo;
  final String prenom;

  MedecinModele(
    this.id,
    this.username,
    this.email,
    this.adresse,
    this.numero,
    this.password,
    this.nom,
    this.photo,
    this.prenom,
    this.specialite,
  );

  factory MedecinModele.fromMap(Map userMap) {
    return MedecinModele(
      userMap['id'],
      userMap['username'],
      userMap['email'],
      userMap['adresse'],
      userMap['numero'],
      userMap['password'],
      userMap['nom'],
      userMap['prenom'],
      userMap['specialite'],
      userMap['photo'],
    );
  }
}*/

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
        });
/*
 factory MedecinModel.fromJson(Map<String, dynamic> json) {
   return MedecinModel(
       idmedecin : json['idmedecin'],
    nom : json['nom'],
    prenom : json['prenom'],
    photo : json['photo'],
    telehone : json['telehone'],
    email : json['email'],
    ville : json['ville'],
    adresse : json['adresse'],
    diplome : json['diplome'],
    specialite : json['specialite'],
    etat : json['etat'],
    hopital :
    json['hopital'] != null ? Hopital.fromJson(json['hopital']) : null,
    utilisateus : json['utilisateus']);
  }*/

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
if(Hopital != null){
  data['Hopital'] = Hopital().toJson();
}


    return data;
  }
}







