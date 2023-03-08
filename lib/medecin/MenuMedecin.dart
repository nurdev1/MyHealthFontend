import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante/medecin/AccueilMedecin.dart';

import '../Patient/dossier/AjouterDossier.dart';
import '../page/Connexion.dart';
import '../page/DossierList.dart';
import 'ConnexionMedecinPatient.dart';
import 'medecinListePatient/MedecinListe.dart';

class MedecinMenu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.0,
              1.0
            ],
                colors: [
              Theme.of(context).primaryColor.withOpacity(0.2),
              Theme.of(context).accentColor.withOpacity(0.5),
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
                child: Text(
                  "MaSante",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white)
                  )
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.screen_lock_landscape_rounded,
                size: 40,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Accueil',
                style:  GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal)
                )
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedecinAccueil()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add_alt_1,
                  size: 40, color: Theme.of(context).accentColor),
              title: Text(
                'Patient',
                style:  GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal)
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComptePatient()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.password_rounded,
                size:  40,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Liste Consultation',
                style:  GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal)
                )
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DossierList()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.verified_user_sharp,
                size: 40,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Liste Patients',
                style:  GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal)
                )
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MedecinListPatientPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.login_rounded,
                  size: 40, color: Theme.of(context).accentColor),
              title: Text(
                'Connexion',
                style:  GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal)
                )
              ),
              onTap: () {},
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                size: 40,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Deconnexion',
                style:  GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal)
                )
              ),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
