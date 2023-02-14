import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/dossier/AjouterDossier.dart';
import 'package:masante/Patient/PatientListeMedecin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../../widget/EntetePage.dart';
import '../MenuPatient.dart';
import '../profile/profile_page.dart';



class PatientAccueil extends StatelessWidget {
  //const PatientAccueil({Key? key}) : super(key: key);
  double _headerHeight =  120;
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
    double  _drawerIconSize = 24;
    double _drawerFontSize = 17;
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
                            radius: 35,
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
      drawer: PatientMenu(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                SizedBox(height: 65,),
                Padding(padding: EdgeInsets.only(left: 15),
                  child:
                  GestureDetector(
                    child: Text(
                      "Les dossiers",
                      style: GoogleFonts.openSans(
                          textStyle:  const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,color:Colors.black)
                      )
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AjouterDossierPage()
                      )
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
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
                            margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15
                            ),
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
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
                        style: GoogleFonts.openSans(
                            textStyle:  const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,color:Colors.black)
                        ),
                      ),

                      GestureDetector(
                        child:  Text('Voir plus',
                            style: GoogleFonts.openSans(
                                textStyle:  const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,color:Colors.black)
                            )
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PatientListeMedecinPage()
                          )
                          );
                        },
                      ),
                    ],
                  ),
                ),
                PatientListeMedecinPage()
               ],
            ),
            )
          ],
        ),
      ),
    );
  }
}

