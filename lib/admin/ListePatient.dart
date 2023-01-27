import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/admin/component/AdminSpecialiteMedecin.dart';

import '../config/responsive.dart';
import '../medecin/MedecinProfil.dart';
import 'MedecinNouveau.dart';
import 'component/MenuAdmin.dart';

class AdminPatientListePage extends StatelessWidget {
  const AdminPatientListePage({Key? key}) : super(key: key);

  @override
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AdminSpecialiteMedecinWidget(),
                            Text('Liste médecins' ,style: GoogleFonts.openSans(
                                textStyle: const TextStyle(fontSize: 40,)
                            ),),
                            SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListeMedecinTableau(),
                            )
                          ],
                        ),
                      ),
                    )),

                /*if(Responsive.isDesktop(context))
                Expanded(
                  flex: 1,
                  child: Container(),
                ),*/
              ],
            ),
          ),
        )
    );
  }
}

