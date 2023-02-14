class RoleModele  {
  final int id;
  final String nom;

  RoleModele ({
    required this.id,
    required this.nom,
  });

  factory RoleModele .fromJson(Map<String, dynamic> json) {
    return RoleModele (
      id: json['id'],
      nom: json['nom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
    };
  }
}
