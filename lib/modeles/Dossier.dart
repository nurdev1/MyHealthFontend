class DossierModele {
  late final String iddossier;
  final String nom;
  final String? date;
  final String patient;

  DossierModele(
  this.iddossier,
   this.nom,
    this.date,
   this.patient
      );

  //collection en objet
  factory DossierModele.fromMap(Map json) {
    return DossierModele(
       json['iddossier'],
       json['nom'],
     json['date'],
      json['patient']
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
