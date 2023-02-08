import 'package:masante/modeles/Dossier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addDossier(DossierModele dossier) async {
  final docFile = FirebaseFirestore.instance.collection("Dossier").doc();
  dossier.iddossier = docFile.id;
  await docFile.set(dossier.toJson());
}

//-----------------Mise a jour-----------
Future updateDossier(DossierModele dossier) async {
  final docFile =
      FirebaseFirestore.instance.collection('Dossiers').doc(dossier.iddossier);
  await docFile.update(dossier.toJson());
}

//------------Suppression----------------
Future deleteDossier(String id) async {
  final docFile = FirebaseFirestore.instance.collection('Dossier').doc(id);
  await docFile.delete();
}
