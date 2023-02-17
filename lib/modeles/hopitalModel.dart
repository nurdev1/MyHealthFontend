
class HopitalsModel {
  String? idhopital, nom, photo, adresse,ville,date;

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
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idhopital'] = idhopital;
    data['nom'] = nom;
    data['ville'] = ville;
    data['adresse'] = adresse;
    data['photo'] = photo;
    return data;
  }

}
