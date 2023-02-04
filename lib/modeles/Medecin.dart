import 'Hopital.dart';

class Medecin {
  int idmedecin;
  String nom;
  String prenom;
  String? photo;
  String telehone;
  String email;
  String ville;
  String adresse;
  String diplome;
  String specialite;
  bool? etat;
  Hopital hopital;

  Medecin(
      {required this.idmedecin,
      required this.nom,
      required this.prenom,
      required this.photo,
      required this.telehone,
      required this.email,
      required this.ville,
      required this.adresse,
      required this.diplome,
      required this.specialite,
      this.etat=false,
      required this.hopital});

 factory Medecin.fromJson(Map<String, dynamic> json) {
    return Medecin(
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
    hopital : json['hopital']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idmedecin' : idmedecin,
      'nom' : nom,
      'prenom' : prenom,
      'photo' : photo,
      'telehone' : telehone,
      'email' : email,
      'ville' : ville,
      'adresse' : adresse,
      'diplome' : diplome,
      'specialite' : specialite,
      'etat' : etat,
       'hopital' : hopital,
    };
  }
}

