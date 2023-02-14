import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Patient/profile/profile_page.dart';
import '../medecin/profile/MedecinProfil.dart';
import '../widget/EntetePage.dart';

class DossierList extends StatelessWidget {
  // const MedecinAccueil({Key? key}) : super(key: key);
  double _headerHeight =  180;

  @override
  Widget build(BuildContext context) {
    return Material(
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
                              const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
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
                          SizedBox(height: 40),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Liste Dossier Médecal',style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                                  ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          fillColor: HexColor('#54DEFC').withOpacity(0.5),
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10)
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: (){},
                                            child: Container(
                                              padding: EdgeInsets.all(2),
                                              margin: EdgeInsets.symmetric(horizontal: 2),
                                              decoration:  BoxDecoration(
                                                color: HexColor('#54DEFC'),
                                                borderRadius:
                                                const BorderRadius.all(Radius.circular(10)
                                                ),
                                              ),
                                              child: Icon(Icons.search),
                                            ),
                                          )
                                        ),
                                      )
                                  )
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 5),

                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),


                  ],

                ),
              )
            ]
        )
    );

  }
}
