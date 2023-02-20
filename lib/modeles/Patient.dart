class ModelPatient {
  int? idpatient;
  String? nom;
  String? prenom;
  String? photo;
  String? telephone;
  String? email;
  String? ville;
  String? adresse;
  bool? etat;
  String? codePatient;
  String? motdepasse;


  ModelPatient(
      {this.idpatient,
        this.nom,
        this.prenom,
        this.photo,
        this.telephone,
        this.email,
        this.ville,
        this.adresse,
        this.etat,
        this.codePatient,
        this.motdepasse
       });

  /*ModelPatient.fromMap(Map json){
    idpatient = json['idpatient'];
    nom = json['nom'];
    prenom = json['prenom'];
    photo = json['photo'];
    telephone = json['telephone'];
    email = json['email'];
    ville = json['ville'];
    adresse = json['adresse'];
    etat = json['etat'];
    utilisateus = json['utilisateus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idpatient'] = this.idpatient;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['photo'] = this.photo;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['ville'] = this.ville;
    data['adresse'] = this.adresse;
    data['etat'] = this.etat;
    data['utilisateus'] = this.utilisateus;
    return data;
  }*/

  ModelPatient.fromJson(Map<String, dynamic> json){
    idpatient= json['idpatient'];
    nom = json['nom'];
    prenom = json['prenom'];
    photo = json['photo'];
    telephone = json['telephone'];
    email = json['email'];
    ville = json['ville'];
    adresse = json['adresse'];
    etat = json['etat'];
    codePatient=json['codePatient'];
    motdepasse=json['motdepasse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['idmedecin'] = this.idpatient;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['photo'] = this.photo;
    data['telehone'] = this.telephone;
    data['email'] = this.email;
    data['ville'] = this.ville;
    data['adresse'] = this.adresse;
    data['etat'] = this.etat;
    data['codePatient']=this.codePatient;
    data['motdepasse']=this.motdepasse;
    return data;
  }
}