
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
}