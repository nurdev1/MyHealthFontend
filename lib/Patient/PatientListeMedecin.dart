import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/profile/profile_page.dart';


import '../medecin/profile/MedecinProfil.dart';
import '../widget/EntetePage.dart';
import '../widget/InformationMedecin.dart';
import '../widget/SpecialiteMedecin.dart';
import 'MedecinDetails.dart';
import 'MenuPatient.dart';

class PatientListeMedecinPage extends StatelessWidget {
  const PatientListeMedecinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double  _drawerIconSize = 24;
    double _drawerFontSize = 17;
    double _headerHeight=100;
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
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MedecinDetail(),
          )
          );
        },
        child: ListView(
          children: [
            Stack(
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
                            SizedBox(height: 5),
                            Text(
                              "Liste Medecin",
                              style: TextStyle(
                                color: HexColor('#EB455F'),
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],

                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            Container(
              //height: 500,
              padding: EdgeInsets.only(top: (15)),
              decoration: BoxDecoration(
                  color: Color(0xFFECEFF1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)
                  )
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                   // height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "rechercher médecin"
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Text("Spécialité",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: HexColor("54DEFC")
                    ),),
                  ),
                  //spécialité a scroller
                  SpecialiteMedecinWidget(),
                  /*Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical:20, horizontal: 10),
                  )*/
                  MedecinInformation(),
                ],
              ),

            )
          ],
        ),
      ),
    );

  }
}

