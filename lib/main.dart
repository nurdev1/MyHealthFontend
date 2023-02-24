import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:localization/localization.dart';
import 'package:masante/Patient/PatientListeMedecin.dart';
import 'package:masante/Patient/home/PatientAccueil.dart';
import 'package:masante/Patient/home/PatientNew.dart';
import 'package:masante/admin/Dashboard.dart';
import 'package:masante/admin/ListePatient.dart';
import 'package:masante/admin/component/Profil/Screens/ProfileScreen.dart';
import 'package:masante/medecin/AccueilMedecin.dart';
import 'package:masante/medecin/medecinListePatient/MedecinListe.dart';
import 'package:masante/medecin/profile/MedecinProfil.dart';
import 'package:masante/page/Choix.dart';
import 'package:masante/page/Connexion.dart';
import 'package:masante/page/DossierAjout/DossierAjout.dart';
import 'package:masante/page/DossierList.dart';
import 'package:masante/page/PatientNew.dart';
import 'package:masante/page/splash/SplashPage.dart';
import 'package:masante/page/table/Tablemain.dart';

import 'Patient/dossier/AjouterDossier.dart';
import 'Patient/dossier/test.dart';
import 'Patient/inscription/Inscription.dart';
import 'admin/ListeHopital.dart';
import 'admin/PatientListeTableau.dart';
import 'admin/component/AdminSplashPage.dart';
import 'admin/hopital/screens/home/home_screen.dart';
import 'admin/hopital/screens/main/main_screen.dart';
import 'admin/test.dart';
import 'medecin/Consultaion1.dart';
import 'medecin/Inscription/InscriptionMedecin.dart';
import 'medecin/PatientListePage.dart';
import 'medecin/consultation/consultation.dart';
import 'medecin/profile/ModifierProfile.dart';





Future<void> main() async {
  runApp(LoginUiApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class LoginUiApp extends StatelessWidget {
  final Color _primaryColor = HexColor('#54DEFC');
  final Color _accentColor = HexColor('#54DEFC');

  LoginUiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
      /*  GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,*/
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
    //home: Splash(title: 'Myhealth',),
      // home: AdminSplash(title: 'Myhealth',),
       home: PatientNewT(),
    );
/*  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HopitalProvider>(
      create: (context) => HopitalProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Hopital(),
      ),
    );*/
  }
}
