import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Patient/MenuPatient.dart';
import '../Patient/profile/profile_page.dart';
import '../medecin/profile/MedecinProfil.dart';
import '../widget/EntetePage.dart';
import '../widget/ListeDossierWidget.dart';

class DossierList extends StatelessWidget {
  // const MedecinAccueil({Key? key}) : super(key: key);
  double _headerHeight =  90;

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
                            radius: 35,
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
      body: Material(
          child: Stack(
              children: [
                Container(
                  height: _headerHeight,
                  child: EnteteWidhet(_headerHeight,  false),
                ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Liste Dossier Médecal',style: GoogleFonts.openSans(
                                    textStyle:  TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: HexColor('#EB455F'))
                                ),
                                ),
                                //Spacer(),
                                SizedBox(height: 40),
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
                                ),

                              ],
                            ),
                            const SizedBox(height: 30,),
                            Container(
                              height: 1000,
                              child: WidgetDossier(),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),

              ]
          )
      ),
    );

  }
}
