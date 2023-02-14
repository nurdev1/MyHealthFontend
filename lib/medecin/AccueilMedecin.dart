import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/medecin/medecinListePatient/MedecinListe.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Patient/MenuPatient.dart';
import '../Patient/PatientListeMedecin.dart';
import '../widget/EntetePage.dart';
import 'profile/MedecinProfil.dart';
import 'PatientListePage.dart';

class MedecinAccueil extends StatelessWidget {
 // const MedecinAccueil({Key? key}) : super(key: key);
  double _headerHeight =  140;
  List Noms = [
    "Consultation",
    "Analyse",
    "Radiographie",
    "Traitement",
    "Antécetent"
  ];

  List<Icon> LesIcons = [
    Icon(MdiIcons.file, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.heartPlus, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.eye, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.brain, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.earHearing, color: HexColor('#54DEFC'),size: 30,),
  ];

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Stack(
        children: [
          Container(
            height: _headerHeight,
            child: EnteteWidhet(_headerHeight,  false),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/images/profil.jpg"),
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Salut Mariam",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "votre dossier médical \nest notre priorité",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(padding: EdgeInsets.only(left: 15),
                  child:
                  GestureDetector(
                    child: Text(
                      "Les dossiers",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MedecinListPatientPage()
                      )
                      );
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: Noms.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15
                              ),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFF2F8FF),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: LesIcons[index],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(Noms[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(height: 45,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mes médecins",
                        style: (TextStyle
                          (
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
                        )
                        ),
                      ),

                      GestureDetector(
                        child: Text('Voir plus',
                            style: TextStyle(
                              fontSize: 20,
                            )
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PatientListePage()
                          )
                          );
                        },
                      ),
                    ],
                  ),
                ),
                PatientListePage()
              ],
            ),
          )
        ],
      ),
    );
  }
}