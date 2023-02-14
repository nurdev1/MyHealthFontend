class MHopital{
  final int id;
  final String nom;
  final String? ville;
  final String img;

  MHopital( {
    required this.id,
    required this.nom,
    required this.ville,
    required this.img,
  });

  factory MHopital.fromMap(Map entiteMap){
    return MHopital(
        id: entiteMap['id'],
        nom: entiteMap['nom'],
        ville: entiteMap['ville'],
        img: entiteMap['img']
    );
  }
}