import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../medecin/AccueilMedecin.dart';


class MedecinDetail extends StatefulWidget {

 // final Patient selectedPatient;
  const MedecinDetail({Key? key}) : super(key: key);
 // ,required this.selectedPatient
  @override
  State<MedecinDetail> createState() => _MedecinDetailState();
}

class _MedecinDetailState extends State<MedecinDetail> {

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children:<Widget> [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent,
          ),
          Container(
            height: screenHeight - screenHeight / 3,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profil.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: HexColor('#54DEFC'),
              size: 35,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MedecinAccueil())
              );
            },
          ),

          Positioned(
            top: screenHeight - screenHeight/3 -25.0,
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                height: screenHeight / 3 + 25.0,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   /* Text(widget.selectedPatient.nom,
                      style: GoogleFonts.poppins(fontSize: 25.0,fontWeight: FontWeight.w500),
                    ),*/
                    SizedBox(height: 7.0,),
                    Text('Dr Fatoumata',
                      style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w900,color:HexColor('#54DEFC')),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      width: 180.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SizedBox(height: 7.0,),
                              Row(
                                children: [
                               /*   Icon(
                                    Icons.email,
                                    color: HexColor('#EB455F'),
                                    size: 20,
                                  ),*/
                                  const SizedBox(
                                    height: 5,
                                    width: 30,
                                  ),
                                  Text("fk1@gmail.com",
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text('76907854',
                                style: GoogleFonts.poppins(fontSize: 18.0,fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 7.0,),
                              Text('fs1@gmail.com',
                                style: GoogleFonts.poppins(fontSize: 18.0,fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 7.0,),
                              Text('Dentiste',
                                style: GoogleFonts.poppins(fontSize: 18.0,fontWeight: FontWeight.w500),
                              ),
                             /* TextButton(
                                child: Text('Dentiste'.toUpperCase(), style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlue),),
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MedecinAccueil()
                                  )
                                  );
                              },
                              )*/
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0))
                ),
              ))
        ],
      ),
    );
  }
}
