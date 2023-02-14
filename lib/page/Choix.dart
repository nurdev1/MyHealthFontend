import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/page/Connexion.dart';

import '../Patient/Connexion/Connexion.dart';
import '../Patient/inscription/Inscription.dart';
import '../medecin/Inscription/InscriptionMedecin.dart';


class ChoixPage extends StatefulWidget {
  const ChoixPage({Key? key}) : super(key: key);

  @override
  State<ChoixPage> createState() => _ChoixState();
}

class _ChoixState extends State<ChoixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: HexColor('EB455F'),
                          size: 35,
                        ),
                        onTap: () {

                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/Masante.png",),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration:  const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Masante.png'),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 20),
                          child: CarouselSlider(
                              items: [
                                Container(
                                  height: 100,
                                  decoration:  BoxDecoration(
                                    image:  const DecorationImage(
                                      image:
                                      AssetImage('assets/images/all.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  decoration:  BoxDecoration(
                                    image:  const DecorationImage(
                                      image:
                                      AssetImage('assets/images/consultation.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  decoration:  BoxDecoration(
                                    image:  const DecorationImage(
                                      image:
                                      AssetImage('assets/images/vue.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                height: 120.0,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16/9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                viewportFraction: 0.8,
                              )
                          ),
                        ),
                        Text(
                          'MaSante ',/*'Votre dossier medical informatisé ',*/
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle:  TextStyle(
                                  fontSize: 25,fontWeight: FontWeight.bold,color:HexColor('54DEFC'))
                          ),
                        ),
                        Text(
                          'Information médical \nnumérique',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle:  const TextStyle(
                                  fontSize: 20,color: Colors.white)
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Text('Creer votre compte et retouver à tout\n moment les informations patients.',
                      style: GoogleFonts.openSans(
                          textStyle:   TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,color:HexColor('EB455F'))
                      )
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Container(
                          height: 200,
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
                      ],
                    ),
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
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profil.jpg",),
                        fit: BoxFit.cover,
                      )
                  ),
                ),

              ],
            ),
            SizedBox(height: 30,),
            Text('Patient', style: GoogleFonts.openSans(
                textStyle:  const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,color:Colors.white)
            )
            ),


          ],
        ),
      ),
    );

  }
}



