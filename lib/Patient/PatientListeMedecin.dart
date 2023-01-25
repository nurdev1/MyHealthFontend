import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


import '../medecin/MedecinProfil.dart';
import '../widget/EntetePage.dart';
import '../widget/InformationMedecin.dart';
import '../widget/SpecialiteMedecin.dart';

class PatientListeMedecinPage extends StatelessWidget {
  const PatientListeMedecinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _headerHeight=120;
    return Scaffold(
      body: ListView(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  GestureDetector(
                                    child: CircleAvatar(
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
                          SizedBox(height: 25),
                          Text(
                            "Liste Medecin",
                            style: TextStyle(
                              color: Colors.black,
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
    );

  }
}

