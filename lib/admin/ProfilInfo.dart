import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../medecin/AccueilMedecin.dart';
import 'PlatformService.dart';

class ProfileInFo extends StatelessWidget {
  String data =
      'An artist of considerable range, Jenna the name taken by Melbourne-raised, Brooklyn-based Nick Murphy writes, performs and records all of his own music, giving it a warm, intimate feel with a solid groove structure. An artist of considerable range.';
  late bool isMobile;

  @override
  Widget build(BuildContext context) {
    isMobile = PlatFormServices.isMobile(context) ? true : false;
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          /// card header
          Container(
              width: double.infinity,
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Spacer(flex: 1),
                SocialValue('Experience', 12),
                SocialValue('Patient', 10),
                SocialValue('Consultation', 86),
                Spacer(flex: 10),
              TextButton( onPressed: (){
                //After successful login we will redirect to profile page. Let's create profile page now
                Navigator.pushReplacement(context, MaterialPageRoute(builder:
                    (context) => MedecinAccueil()));
              },
                  child:  Text('Modifier'.toUpperCase(), style:
               TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ),
                Spacer(flex: 1)
              ])),
          SizedBox(height: isMobile ? 20 : 50),
          Text('Dr Fatoumata Sy',style: TextStyle(fontSize: 18, color: Colors.black),),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_pin, size: 20, color: HexColor('#EB455F')),
                SizedBox(width: 15),
                Text('Bamako',style: TextStyle(fontSize: 18, color: Colors.black),)
              ]),
          SizedBox(height: 30),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(MdiIcons.heartPlus, size: 20, color: HexColor('#EB455F')),
                SizedBox(width: 15),
                Text('Cardiologue',style: TextStyle(fontSize: 18,  color: Colors.black),)
              ]),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(MdiIcons.hospital, size: 20, color: HexColor('#EB455F')),
                SizedBox(width: 15),
               Text("Mére et L\'enfant",style: TextStyle(fontSize: 18, color: Colors.black),)
              ]),

        ]));
  }

  Widget SocialValue(String label, int value) => Container(
      padding: EdgeInsets.all(5),
      height: 50,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$value',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text(label,
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ]));
}
