import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/admin/ListeHopitalTableau.dart';
import 'package:masante/admin/VilleHopital.dart';

import '../config/responsive.dart';
import '../medecin/MedecinProfil.dart';
import 'component/MenuAdmin.dart';

class AdminListeHopitaPage extends StatelessWidget {
  const AdminListeHopitaPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:HexColor('#54DEFC') ,
          actions: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                      GestureDetector(
                        child: const CircleAvatar(
                          radius: 25,
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
            )
          ],
        ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(Responsive.isDesktop(context))
                Expanded(
                    flex:2,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(67),
                        ),
                        child: Menu())
                ),

              Expanded(
                flex: 13,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text('Liste des Hôpitaux' ,style: GoogleFonts.openSans(
                                textStyle: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold)
                            ),),
                          ],
                        ),
                      ),

                     /* const SizedBox(height: 10,),
                      Container(
                        width: 500,
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 5),
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
                          ),
                        ),
                      ),*/
                      AdminVilleHopitalWidget(),

                      //SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          padding:  EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const ListeHopitalTableau(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /*if(Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: Container(),
              ),*/
            ],
          ),
        )
    );
  }
}

