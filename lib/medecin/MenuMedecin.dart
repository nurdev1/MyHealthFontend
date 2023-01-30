import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../page/DossierList.dart';
import 'AjouterDossier.dart';
import 'Connexion.dart';
import 'PatientAccueil.dart';
import 'PatientListeMedecin.dart';

class PatientMenu extends StatelessWidget {
  const PatientMenu({
    Key? key,
    required double drawerIconSize,
    required double drawerFontSize,
  }) : _drawerIconSize = drawerIconSize, _drawerFontSize = drawerFontSize, super(key: key);

  final double _drawerIconSize;
  final double _drawerFontSize;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AjouterDossier()),);
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
    );
  }
}
