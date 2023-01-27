import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../config/responsive.dart';
import '../medecin/MedecinProfil.dart';
import 'component/MenuAdmin.dart';

class AdminListeHopitaPage extends StatelessWidget {
  const AdminListeHopitaPage({Key? key}) : super(key: key);

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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /*Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: HexColor('#54DEFC').withOpacity(0.30),
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),*/
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: HexColor('#54DEFC'),
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
                    ),
                  )),

              if(Responsive.isDesktop(context))
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
            ],
          ),
        )
    );
  }
}
