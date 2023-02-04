class ModelPatient {
   int idpatient;
  final String nom;
  final String prenom;
  final String photo;
  final String telephone;
  final String email;
  final String ville;
  final String adresse;
  final bool etat;

   ModelPatient(
     this.idpatient,
      this.nom,
       this.prenom,
      this.photo,
       this.telephone,
     this.email,
       this.ville,
      this.adresse,
       this.etat);

  factory ModelPatient.fromMap(Map json) {
    return ModelPatient(
    json['idpatient'],
    json['nom'],
      json['prenom'],
      json['photo'],
      json['telephone'],
      json['email'],
     json['ville'],
    json['adresse'],
     json['etat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (idpatient != 0) 'idpatient': idpatient,
      // 'idpatient' : idpatient,
      'nom': nom,
      'prenom': prenom,
      'photo': photo,
      'telephone': telephone,
      'email': email,
      'ville': ville,
      'adresse': adresse,
      'etat': etat,
    };
  }
}
