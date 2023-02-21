import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/Consultation.dart';
import 'package:masante/medecin/MenuMedecin.dart';
import 'package:masante/medecin/medecinListePatient/MedecinListe.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Patient/MenuPatient.dart';
import '../Patient/PatientListeMedecin.dart';
import '../widget/EntetePage.dart';
import 'ConsultationAccueilMedecin.dart';
import 'PatinetAcceuilListe.dart';
import 'profile/MedecinProfil.dart';
import 'PatientListePage.dart';

class MedecinAccueil extends StatelessWidget {
 // const MedecinAccueil({Key? key}) : super(key: key);
  double _headerHeight =  120;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                                builder: (context) => MedecinProfil()
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
      drawer: MedecinMenu(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                          Text(
                            "Salut Mariam",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 70,),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            Container(
                              height: 160,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children:<Widget> [
                                  GestureDetector(
                                    child: MakeItemPatient(image:'assets/images/profil.jpg'),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => MedecinListPatientPage()
                                      )
                                      );
                                    },
                                  ),GestureDetector(
                                    child: MakeItemConsultation(image:'assets/images/cons.jpg'),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => ConsulationsListe()
                                      )
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   // SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mes patients",
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
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white))
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PatientListePage()
                              )
                              );
                            },
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                    PatientAccueilListe(),
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
                   MedecinHomeConsultation(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget MakeItemConsultation({image,titre}) {
    return Row(
      children: [
        AspectRatio(
          aspectRatio: 1.7 / 2,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor('#EB455F')
                //.withOpacity(0.2)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children:<Widget> [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/images/cons.jpg",),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),

                  ],
                ),
                SizedBox(height:10,),
                Text('Medecin', style: GoogleFonts.openSans(
                    textStyle:   TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,color:HexColor('54DEFC'))
                )
                ),
                SizedBox(height: 5,),
                Text('18', style: GoogleFonts.openSans(
                    textStyle:  GoogleFonts.openSans(
                        textStyle:  TextStyle(fontSize: 12,
                          fontWeight: FontWeight.normal,color: HexColor('#54DEFC'),)
                    )
                ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }
  Widget MakeItemPatient({image,titre}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
          aspectRatio: 1.7 / 2,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor('#EB455F')
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children:<Widget> [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/images/pa.png",),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Text('Patient', style: GoogleFonts.openSans(
                    textStyle:  GoogleFonts.openSans(
                        textStyle:  TextStyle(fontSize: 12,
                            fontWeight: FontWeight.normal,color: HexColor('#54DEFC'),)
                )
                ),
                ),
                SizedBox(height: 5,),
                Text('12', style: GoogleFonts.openSans(
                    textStyle:  GoogleFonts.openSans(
                        textStyle:  TextStyle(fontSize: 12,
                          fontWeight: FontWeight.normal,color: HexColor('#54DEFC'),)
                    )
                ),
                ),

              ],
            ),
          ),
        ),
      ],
    );

  }

}