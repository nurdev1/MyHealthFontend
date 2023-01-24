import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/page/Connexion.dart';

import '../Patient/Inscription.dart';
import '../medecin/InscriptionMedecin.dart';


class ChoixPage extends StatefulWidget {
  const ChoixPage({Key? key}) : super(key: key);

  @override
  State<ChoixPage> createState() => _ChoixState();
}

class _ChoixState extends State<ChoixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 35,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LoginPage()
                          )
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                  ), SizedBox(height: 45,),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Text('Creer votre compte et retouver à tout moment les informations patients.',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                      ),),
                    ),
                  ),
                  SizedBox(height: 45,),
                  Stack(
                    children: <Widget> [
                      Container(
                        decoration: BoxDecoration(
                           /* image: DecorationImage(
                              image: AssetImage("assets/images/folder.png",),
                              fit: BoxFit.cover,
                            )*/
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.9),
                                    Colors.black.withOpacity(0.3),
                                  ]
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget> [
                                Container(
                                  height: 400,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children:<Widget> [
                                      GestureDetector(
                                        child: MakeItem(image:'assets/images/profil.jpg'),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => Inscription()
                                          )
                                          );
                                        },
                                      ),GestureDetector(
                                        child: MakeItem(image:'assets/images/profil.jpg'),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => InscriptionMedecin()
                                          )
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

            ),

           ],

    ),
    ),
    );
  }

  Widget MakeItem({image,titre}) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor('#54DEFC')
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children:<Widget> [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profil.jpg",),
                        fit: BoxFit.cover,
                      )
                  ),
                ),

              ],
            ),
            SizedBox(height: 30,),
            Text('Patient', style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
            ),


          ],
        ),
      ),
    );

  }
}



