import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/dossier/AjouterDossier.dart';

import '../../AllFile/global/LaisonBankend.dart';
import '../../widget/EntetePage.dart';
import '../profile/profile_page.dart';

class PatientFirst extends StatelessWidget {
//  const PatientNew({Key? key}) : super(key: key);
  double _headerHeight =  250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: _headerHeight,
                child: EnteteWidhet(_headerHeight,  false),
              ),
              Padding(padding: EdgeInsets.only(top: 30),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding:  EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                     Icon(Icons.chevron_left,color: Colors.white,size: 35,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               const Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                              GestureDetector(
                                child:  const CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/images/user.pnj",),
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
                      )],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                      "salut $nomUser",
                      style: GoogleFonts.openSans(
                          textStyle:  const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,color:Colors.white))
                  ),
                  SizedBox(height: 40,),
                  Text('comment vous sentez vous ?',
                      style: GoogleFonts.openSans(
                          textStyle:   TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,color:HexColor('#EB455F'))
                      )
                  ),
                  SizedBox(height: 70,),
                  //https://assets5.lottiefiles.com/packages/lf20_2ZKqKUm2Jm.json
                  Container(
                    height: 480,
                    decoration:   BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/1.jpg'),
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
                                  height: 200,
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
                                  height: 120,
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
                                  height: 200,
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
                                height: 200.0,
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
                                 fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white)
                           ),
                         ),
                        Text(
                          'Avoir votre dossier medical \nnumérique à porté',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle:  const TextStyle(
                                  fontSize: 25,color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 35,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: HexColor('#EB455F'), // Background color
                          ),
                          child: Text('Commercer'.toUpperCase(), style:
                          const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.white),),
                          onPressed: (){
                            //After successful login we will redirect to profile page. Let's create profile page now
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => AjouterDossierPage()));
                          },
                        ),
                      ],
                    ),
                  )
                ],),
              ),

            ],
          )
        ],
      ),
    );
  }
}

/*https://assets6.lottiefiles.com/packages/lf20_tutvdkg0.json*/