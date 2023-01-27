import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../medecin/MedecinProfil.dart';
import '../widget/EntetePage.dart';

class DossierList extends StatelessWidget {
  // const MedecinAccueil({Key? key}) : super(key: key);
  double _headerHeight =  140;

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
                                          builder: (context) => MedecinProfil()
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
                                children: [
                                  Text('Liste Dossier Médecal',style: TextStyle(
                                    color: HexColor('#54DEFC'),
                                    fontSize: 22,
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
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: HexColor('#54DEFC').withOpacity(0.30),
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 10,
                            width: 10,
                            child: Icon(Icons.file_copy,color: HexColor('#EB455F'),),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                                Text("Consultation",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(fontSize: 20,)
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Suite à des maux de tête",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(fontSize: 18,)
                                  ),
                                  ),
                            ],
                          ),
                              )
                          ),
                          IconButton(
                            iconSize: 25,
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ],
                      ),
                    )

                  ],

                ),
              )
            ]
        )
    );

  }
}
