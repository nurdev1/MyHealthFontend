import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/Connexion/Connexion.dart';
import 'package:masante/Patient/home/PatientAccueil.dart';
import 'package:masante/Patient/home/PatientNew.dart';
import 'package:masante/medecin/AccueilMedecin.dart';
import 'package:masante/page/Connexion.dart';
import 'package:masante/page/splash/SplashPage.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

import 'Patient/inscription/Inscription.dart';
import 'medecin/medecinListePatient/MedecinListe.dart';

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
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
     //home: Splash(title: 'Myhealth',),
      // home: AdminSplash(title: 'Myhealth',),
       home:  MedecinListPatientPage(),
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
