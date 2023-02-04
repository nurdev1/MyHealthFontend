import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/Profil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../page/DossierList.dart';
import 'AjouterDossier.dart';
import 'Connexion/Connexion.dart';
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
        decoration:BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [
                  HexColor('EB455F'),
                  HexColor('EB455F')
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
                  style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
               leading:  CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil.jpg",),
              ),
              title: Text('Fatoumata',style: TextStyle(fontSize: 25,
                  color: Colors.white),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Profil()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.home, size: 40,
                color: Colors.white,),
              title: Text('Accueil', style: TextStyle(fontSize: 25,
                  color:Colors.black,),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PatientAccueil()));
              },
            ),
            //Divider(color: Theme.of(context).primaryColor, height: 1,),
            ListTile(
              leading: Icon(Icons.medical_information, size:40 ,
                color: Colors.white,),
              title: Text('Liste Dossier',style: TextStyle(
                  fontSize: 25,color:Colors.black),),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(
                    builder: (context) => DossierList()),);
              },
            ),
            //Divider(color: Theme.of(context).primaryColor, height: 1,),
            ListTile(
              leading: Icon(MdiIcons.doctor, size: 40,
                color: Colors.white,),
              title: Text('Liste Médecin',style: TextStyle(fontSize: 25,
                  color: Colors.black),),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(
                    builder: (context) => PatientListeMedecinPage()), );
              },
            ),
            ListTile(
              leading: Icon(Icons.login_rounded,
                  size: 40,
                  color: Colors.white),
              title: Text('Connexion Page', style: TextStyle(fontSize: 25,
                  color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LoginPage()),);
              },
            ),
           /* Divider(color: Theme.of(context).primaryColor, height: 1,),*/
            Divider(color: Theme.of(context).primaryColor, height: 1,),
            ListTile(
              leading: Icon(Icons.logout_rounded,
                size: 40,
                color: Colors.white,),
              title: Text('Logout',style: TextStyle(fontSize: 25,
                  color: Colors.black),),
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
