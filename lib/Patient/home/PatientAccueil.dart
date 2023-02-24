import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:masante/Patient/PatientListeMedecin.dart';
import 'package:masante/page/DossierList.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widget/EntetePage.dart';
import '../MenuPatient.dart';
import '../profile/profile_page.dart';
import 'Consultation.dart';
import 'MedecinListe.dart';



class PatientAccueil extends StatelessWidget {
  //const PatientAccueil({Key? key}) : super(key: key);
  double _headerHeight =  120;
  List Noms = [
    "Dentiste",
    "Cardiologue",
    "Généraliste",
    "Neurologue",
    "Dermatologie"
  ];

  List<Icon> LesIcons = [
    Icon(MdiIcons.toolboxOutline, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.heartPlus, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.eye, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.brain, color: HexColor('#54DEFC'),size: 30,),
    Icon(MdiIcons.earHearing, color: HexColor('#54DEFC'),size: 30,),
  ];

  @override
  Widget build(BuildContext context) {
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
      drawer: PatientMenu(),
      body: SingleChildScrollView(
        child: Material(
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
                          SizedBox(height: 15),
                          Text(
                            " Salut $nom",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          //SizedBox(height: 10),
                    /*      Text(
                            "votre dossier médical \nest notre priorité",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),*/
                        ],
                      ),
                    ),
                    SizedBox(height: 90,),
                    Padding(padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text(
                            "Mes dossier",
                            style: TextStyle(
                              color: HexColor('#EB455F'),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      child: Container(
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DossierList()
                        )
                        );
                      },
                    ),
                    SizedBox(height: 15,),
                    Padding(padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Mes Consultations",
                        style: TextStyle(
                          color: HexColor('#EB455F'),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    PatientHomeConsultation(),
                    SizedBox(height: 15,),

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
                              color: HexColor('#EB455F'),
                            )
                            ),
                          ),
                          GestureDetector(
                            child: Text('Voir plus',
                                style: TextStyle(
                                  fontSize: 20,
                                )
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PatientListeMedecinPage()
                              )
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    MedecinListe()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
