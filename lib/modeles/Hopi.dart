
class HopiModel {
  int idhopital;
  String nom;
  String ville;
  String adresse;
  String photo;

  HopiModel(
      this.idhopital,
      this.nom,
      this.ville,
      this.adresse,
      this.photo
      );



  factory HopiModel.fromMap(Map json) {
    return HopiModel(
      json['idhopital'],
      json['nom'],
      json['ville'],
      json['adresse'],
      json['photo'],
    );
  }

  Map<String, dynamic> toJson(HopiModel hopital ) {
    return
      {
        'idhopital' : idhopital,
        'nom' : nom,
        'ville' : ville,
        'adresse' : adresse,
        'photo' : photo
      };
  }

  @override
  String toString() {
    return 'Product{id: $idhopital,'
        ' nom: $nom,'
        ' adresse: $adresse,'
        ' photo: $photo,'
        ' ville: $ville}';
  }
}