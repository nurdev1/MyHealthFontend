import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/page/Connexion.dart';

import '../Patient/Connexion/Connexion.dart';
import '../Patient/inscription/Inscription.dart';
import '../medecin/Inscription/InscriptionMedecin.dart';
import '../widget/EntetePage.dart';


class ChoixPage extends StatefulWidget {
  const ChoixPage({Key? key}) : super(key: key);

  @override
  State<ChoixPage> createState() => _ChoixState();
}

class _ChoixState extends State<ChoixPage> {

  double _headerHeight =  160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: _headerHeight,
              child: EnteteWidhet(_headerHeight,  false),
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/Masante6.png",),
                    ),
                  ),
                ),
              ],
            ),
           // SizedBox(height: 140,),
            Padding(
              padding: EdgeInsets.only(top: 180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // SizedBox(height: 10,),
                  Container(
                    height: 300,
                    decoration:  const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Masante6.png'),
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
                                  height: 120,
                                  decoration:  BoxDecoration(
                                    image:  const DecorationImage(
                                      image:
                                      AssetImage('assets/images/1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  decoration:  BoxDecoration(
                                    image:  const DecorationImage(
                                      image:
                                      AssetImage('assets/images/3.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  decoration:  BoxDecoration(
                                    image:  const DecorationImage(
                                      image:
                                      AssetImage('assets/images/2.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                height: 150.0,
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
                          'Information médical \nnumérique',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle:   TextStyle(
                                  fontSize: 20,color: Colors.white)
                            //HexColor('EB455F')
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          height: 225,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:<Widget> [
                              GestureDetector(
                                child: MakeItemPatient(image:'assets/images/profil.jpg'),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Inscription()
                                  )
                                  );
                                },
                              ),GestureDetector(
                                child: MakeItemMedecin(image:'assets/images/profil.jpg'),
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

  Widget MakeItemPatient({image,titre}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
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
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/images/pa.png",),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Text('Patient', style: GoogleFonts.openSans(
                    textStyle:   TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,color:HexColor('EB455F'))
                )
                ),


              ],
            ),
          ),
        ),
      ],
    );

  }
  Widget MakeItemMedecin({image,titre}) {
    return Row(
      children: [
        AspectRatio(
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
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/images/me.png",),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Text('Medecin', style: GoogleFonts.openSans(
                    textStyle:   TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,color:HexColor('EB455F'))
                )
                ),


              ],
            ),
          ),
        ),
      ],
    );

  }
}



