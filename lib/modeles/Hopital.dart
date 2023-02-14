class Hopital{
  int? idhopital;
  String? nom;
  String? ville;
  String? adresse;
  String? photo;

  Hopital({this.idhopital, this.nom, this.ville, this.adresse, this.photo,});

  Hopital.fromJson(Map<String, dynamic> json){
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




/*
class Hopital {
  int? idhopital;
  String? nom;
  String? ville;
  String? adresse;
  String? photo;

  Hopital(
  {
   required this.idhopital,
    required this.nom,
    required this.ville,
    required this.adresse,
    required this.photo
  });

  Hopital.empty();

  Hopital.fromJson(Map<String, dynamic> json) {
    idhopital = json['idhopital'];
    nom = json['nom'];
    ville = json['ville'];
    adresse = json['adresse'];
    photo = json['photo'];

  }

  factory Hopital.fromMap(Map<String, dynamic> json) {
    return Hopital(
     idhopital : json['idhopital'],
     nom : json['nom'],
     ville : json['ville'],
     adresse : json['adresse'],
     photo : json['photo'],
   );
  }

  Map<String, dynamic> toJson(Hopital hopital ) {
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
}*/

