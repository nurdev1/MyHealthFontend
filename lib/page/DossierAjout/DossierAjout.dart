import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante/Patient/dossier/AjouterDossier.dart';
import 'package:masante/Patient/PatientListeMedecin.dart';
import 'package:masante/page/DossierList.dart';

import '../../Patient/Connexion/Connexion.dart';
import '../../Patient/inscription/Inscription.dart';
import '../../Patient/home/PatientAccueil.dart';
import '../../Patient/profile/profile_page.dart';
import '../../medecin/profile/MedecinProfil.dart';
import '../../widget/EntetePage.dart';
import '../MotdepasseOublier.dart';
import '../splash/SplashPage.dart';
import '../VerificationMotdepasseOublier.dart';

class DossierAjout extends StatefulWidget {
  const DossierAjout({Key? key}) : super(key: key);

  @override
  State<DossierAjout> createState() => _DossierAjoutState();
}

class _DossierAjoutState extends State<DossierAjout> {
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    double _headerHeight =  120;
    return Scaffold(
        appBar: AppBar(
        /*  title: Text("Profile Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),*/
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace:Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
                )
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only( top: 16, right: 16,),
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.notifications),
                          GestureDetector(
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/images/profil.jpg",),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PatientProfilePage()
                              )
                              );
                            },
                          ),
                        ],
                      )

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration:BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.2),
                      Theme.of(context).accentColor.withOpacity(0.5),
                    ]
                )
            ) ,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text("MaSante",
                      style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.screen_lock_landscape_rounded, size: _drawerIconSize,
                    color: Theme.of(context).accentColor,),
                  title: Text('Accueil', style: TextStyle(fontSize: 17,
                      color: Theme.of(context).accentColor),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PatientAccueil()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,color: Theme.of(context).accentColor),
                  title: Text('Ajouter dossier',style: TextStyle(fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AjouterDossierPage()),);
                  },
                ),
                Divider(color: Theme.of(context).primaryColor, height: 1,),
                ListTile(
                  leading: Icon(Icons.password_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                  title: Text('Liste Dossier',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute(builder: (context) => DossierList()),);
                  },
                ),
                Divider(color: Theme.of(context).primaryColor, height: 1,),
                ListTile(
                  leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,
                    color: Theme.of(context).accentColor,),
                  title: Text('Liste Médecin',style: TextStyle(fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),),
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute(builder: (context) => PatientListeMedecinPage()), );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login_rounded,size: _drawerIconSize,color: Theme.of(context).accentColor),
                  title: Text('Login Page', style: TextStyle(fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                  },
                ),
                Divider(color: Theme.of(context).primaryColor, height: 1,),
                Divider(color: Theme.of(context).primaryColor, height: 1,),
                ListTile(
                  leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                  title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),),
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
              children: [
                Container(
                  height: _headerHeight,
                  child: EnteteWidhet(_headerHeight,  false),
                ),

                          ],


                ),
      )
    );

  }
}
