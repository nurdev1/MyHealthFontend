import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/Profil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../page/Connexion.dart';
import '../page/DossierList.dart';
import 'dossier/AjouterDossier.dart';
import 'home/PatientAccueil.dart';
import 'PatientListeMedecin.dart';

class PatientMenu extends StatelessWidget {
  const PatientMenu({
    Key? key,
  }) :  super(key: key);



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.0,
                  1.0
                ],
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.2),
                  Theme.of(context).accentColor.withOpacity(0.2),
                ])),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor,
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text("MaSante",
                  style:  GoogleFonts.openSans(
                      textStyle: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white)
                  )
                ),
              ),
            ),
            ListTile(
               leading:  CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil.jpg",),
              ),
              title: Text('Fatoumata',style:  GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white)
              )
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Profil()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.home, size: 40,
                color: HexColor('#EB455F'),),
              title: Text('Accueil', style: GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white)
              )
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PatientAccueil()));
              },
            ),
            //Divider(color: Theme.of(context).primaryColor, height: 1,),
            ListTile(
              leading: Icon(Icons.medical_information, size:40 ,
                color: HexColor('#EB455F'),),
              title: Text('Liste Dossier',style:  GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white)
              ),
    ),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(
                    builder: (context) => DossierList()),);
              },
            ),
            //Divider(color: Theme.of(context).primaryColor, height: 1,),
            ListTile(
              leading: Icon(MdiIcons.doctor, size: 40,
                color: HexColor('#EB455F'),),
              title: Text('Liste Médecin',style:  GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white)
              ),
              ),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(
                    builder: (context) => PatientListeMedecinPage()), );
              },
            ),
            ListTile(
              leading: Icon(Icons.login_rounded,
                  size: 40,
                  color: HexColor('#EB455F'),),
              title: Text('Connexion Page', style: GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white)
              )
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const LoginPage()),);
              },
            ),
           /* Divider(color: Theme.of(context).primaryColor, height: 1,),*/
            Divider(color: Theme.of(context).primaryColor, height: 1,),
            ListTile(
              leading: Icon(Icons.logout_rounded,
                size: 40,
                color: HexColor('#EB455F'),),
              title: Text('Deconnexion',style:  GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white)
              )
              ),
              onTap: () {
                SystemNavigator.pop();
              },
             // onTap: () => signOut(context),
              /*onPressed: () => signOut(context),*/
            ),
          ],
        ),
      ),
    );
  }
}
/*
signOut(BuildContext context) {
  Navigator.of(context).pop();
  AuthService().signOut();
}*/
