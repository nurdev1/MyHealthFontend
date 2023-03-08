import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MedecinDetail extends StatelessWidget {
 // final int id;

  const MedecinDetail({/*required this.id,*/ Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //final medecin = medecins.firstWhere((medecin) => medecin.id == id);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent,
          ),
          Container(
            height: screenHeight - screenHeight / 3,
            width: screenWidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/use.jpg'),
                    fit: BoxFit.cover)
            ),
          ),
          /*     GestureDetector(
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
          ),*/

          Positioned(
              top: screenHeight - screenHeight / 3 - 25.0,
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
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      'Nom : ',
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: HexColor('#54DEFC')),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: 180.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 7.0,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                    width: 30,
                                  ),
                                  Text('Nom : ',
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
                              Text(
                                'Téléphone : ',
                                style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                'Email : ',
                                style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                'Spécialité : ',
                                style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
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
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
              ))
        ],
      ),
    );
  }
}


