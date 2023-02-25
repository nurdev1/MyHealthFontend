
class HopitalsModel {
  String? idhopital, nom, photo, adresse,ville,date  ,email,telephone;

  HopitalsModel(
      {
        this.idhopital,
        this.nom,
        this.photo,
        this.adresse,
        this.ville,
        this.date
      });

  HopitalsModel.fromJson(Map<String, dynamic> json){
    idhopital = json['idhopital'];
    nom = json['nom'];
    ville = json['ville'];
    adresse = json['adresse'];
    photo = json['photo'];
    telephone = json['telephone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idhopital'] = idhopital;
    data['nom'] = nom;
    data['ville'] = ville;
    data['adresse'] = adresse;
    data['photo'] = photo;
    data['telehone'] = this.telephone;
    data['email'] = this.email;
    return data;
  }

}
