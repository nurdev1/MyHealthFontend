import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/admin/Dashboard.dart';
import 'package:masante/admin/ListeHopital.dart';
import 'package:masante/admin/ListePatient.dart';
import 'package:masante/admin/MedecinListePage.dart';
import 'package:masante/admin/component/AdminConnexion.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/size_config.dart';




class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      elevation: 0,
        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          color: Color(0xFF3BE5FC),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child:  Image.asset('images/Masante6.png',
                      ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Fatoumata', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                ),
                //SizedBox(height: 2,),
                IconButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Dashboard()
                    )
                    );
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size:30.0,),
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                //SizedBox(height: 2,),
                const Text('Accueil', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                ),
                IconButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AdminListeHopitaPage()
                    )
                    );
                  },
                  icon: const Icon(FontAwesomeIcons.hospital,
                    color: Colors.white,
                    size: 30,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                //SizedBox(height: 2,),
                const Text('Hôpitaux', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                ),
                IconButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AdminMedecinListePage()
                    )
                    );
                  },
                  icon: const Icon(MdiIcons.doctor,
                    color: Colors.white,
                    size: 30,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                //SizedBox(height: 2,),
                const Text('Medécin', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                ),
                IconButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AdminPatientListePage()
                    )
                    );
                  },
                  icon: Icon(Icons.hail,
                    color: Colors.white,
                    size: 30,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                //SizedBox(height: 2,),
                Text('Patient', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                ),
               /* IconButton(
                  onPressed:() {},
                  icon: const Icon(
                    Icons.notification_important_outlined,
                    color: Colors.white,
                    size:30.0,),
                  iconSize: 20,

                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),*/
                //SizedBox(height: 2,),
             /*   Text('Notification', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                ),*/
                IconButton(
                  onPressed:() {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size:30.0,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                //SizedBox(height: 2,),
                Text('Paramètres', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                ),

                 //SizedBox(height: 15,),
              IconButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AdminLogin()
                  )
                  );
                },
                icon: Icon(Icons.close,
                  color: HexColor('#EB455F'),
                  size: 30,),
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
                //SizedBox(height: 2,),
                Text('déconnecter', style: TextStyle(
                  color: HexColor("EB455F"),
                  fontSize: 14,
                ),
                ),
              ],),
          ),
        ),
    );
  }
}
