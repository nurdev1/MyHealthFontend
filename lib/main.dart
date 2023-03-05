import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/PatientListeMedecin.dart';
import 'package:masante/Patient/inscription/Inscription.dart';
import 'package:masante/admin/ListePatient.dart';
import 'package:masante/admin/component/ListeActivite.dart';
import 'package:masante/medecin/AccueilMedecin.dart';
import 'package:masante/medecin/medecinListePatient/MedecinListe.dart';
import 'package:masante/page/Choix.dart';



// ignore: depend_on_referenced_packages

import 'package:masante/page/splash/SplashPage.dart';
import 'package:masante/page/table/Tablemain.dart';

import 'admin/Dashboard.dart';
import 'medecin/PatientListePage.dart';







Future<void> main() async {
  runApp(LoginUiApp());
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
   // home: Splash(title: 'Myhealth',),
       //home: AdminSplash(title: 'Myhealth',),
       home: ChoixPage(),
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
