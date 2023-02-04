class UrlPaths {
  const UrlPaths._();

  static const String url = 'http://localhost:8082';
  //connexion
  static const String signIn = '/api/auth/signin';
  //creation users
  static const String signup = 'api/auth/signup';
  //Patient
  static const String allPatient = '/patient/afficher';
  static const String addPatient = '/patient/ajouter';
  static const String updatePatient = '/patient/modifier';
  static const String deletePatient = '/patient/supprimer';

  //Medecin
  static const String addMedecin = '/medecin/ajouter';
  static const String getMedecin = '/medecin/afficher';
  static const String medecinDone = '/medecin/supprimer';
  static const String medecinbyHopital = '/medecin_hopital';



  static const String getUser = '/user';


}
