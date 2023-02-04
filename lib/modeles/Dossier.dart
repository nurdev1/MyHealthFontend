class Dossier {
  String iddossier;
  String nom;
  // String date;
  // String patient;

  Dossier({
    this.iddossier = '',
    required this.nom,
    //  required this.date,
    // required this.patient
  });

  //collection en objet
  factory Dossier.fromJson(Map<String, dynamic> json) {
    return Dossier(
      iddossier: json['iddossier'],
      nom: json['nom'],
      //  date: json['date'],
      //  patient: json['patient']
    );
  }
//objet en collection
  Map<String, dynamic> toJson() {
    return {
      'iddossier': iddossier,
      'nom': nom,
      //  'date': date,
      // 'patient': patient
    };
  }
}
