
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/AjouterDossier.dart';
import 'package:masante/Patient/ListeMedecin.dart';
import 'package:masante/Patient/PatientAccueil.dart';
import 'package:masante/medecin/InscriptionMedecin.dart';
import 'package:masante/medecin/ListePatient.dart';
import 'package:masante/medecin/PatientListe.dart';
import 'package:masante/medecin/PatientListePage.dart';
import 'package:masante/page/Choix.dart';
import 'package:masante/page/SplashPage.dart';




void main() {
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  Color _primaryColor = HexColor('#54DEFC');
  Color _accentColor = HexColor('#54DEFC');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: Splash(title: 'Myhealth',),
      //home: AdminSplash(title: 'Myhealth',),
      //home: InscriptionMedecin(),

    );
  }
}