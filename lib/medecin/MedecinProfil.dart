import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/medecin/AccueilMedecin.dart';
import 'package:masante/medecin/ListePatient.dart';
import 'package:masante/medecin/ModifierProfile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class MedecinProfil extends StatelessWidget {
   const MedecinProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage(
                     "assets/images/profil.jpg",
                   ),
                 fit: BoxFit.cover,
               ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          HexColor('#54DEFC').withOpacity(0.9),
                          Colors.black.withOpacity(0),
                          Colors.white.withOpacity(0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){},
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F8FF),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      )
                                    ]
                                  ),
                                  child: Center(
                                    child:
                                    GestureDetector(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: HexColor('#54DEFC'), size: 28,),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => MedecinAccueil()
                                        )
                                        );
                                      },
                                    ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                        ),
                        SizedBox(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Patients",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#FFFFFF'),
                                  ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text("45",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Expérience",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text("10",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Consultation",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text("15",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#FFFFFF'),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            ),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr Fatoumata",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: HexColor('#54DEFC'),
                ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(MdiIcons.heartPlus, color: HexColor('#EB455F'), size: 50,),
                    SizedBox(height: 5,),
                    Text("Cardiologue",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Icon(MdiIcons.hospital, color: HexColor('#54DEFC'), size: 45,),
                    SizedBox(height: 5,),
                    Text("Mére et L'enfant",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(MdiIcons.city, color: HexColor('#54DEFC'), size: 40,),
                    SizedBox(height: 5,),
                    Text("Bamako",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                   /* ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon( // <-- Icon
                        MdiIcons.update,
                        color: HexColor('#54DEFC'),
                        size: 24.0,
                      ),
                      label: Text('Modifier',
                        style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),

                      ), // <-- Text
                    ),*/
                    FloatingActionButton.extended(
                      label: Text('Modifier',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ), // <-- Text
                      backgroundColor:  HexColor('#54DEFC'),
                      icon: Icon(MdiIcons.update,size: 24.0,color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ModifierProfilMedecin()
                        )
                        );
                      },
                    ),
                    FloatingActionButton.extended(
                      label: Text('Supprimer',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ), // <-- Text
                      backgroundColor:  HexColor('#EB455F'),
                      icon: Icon(MdiIcons.delete,size: 24.0,color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

              ],
            ),)
          ],
        ),
      ),
    );
  }
}
