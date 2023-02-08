import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'AccueilMedecin.dart';

class PatientDetail extends StatefulWidget {

  final Patient selectedPatient;
  const PatientDetail({Key? key,required this.selectedPatient}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {

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
          Positioned(
            top: screenHeight - screenHeight/3 -25.0,
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                height: screenHeight / 3 + 25.0,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(widget.selectedPatient.nom,
                      style: GoogleFonts.poppins(fontSize: 25.0,fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 7.0,),
                    Text('Hôpital du Mali',
                      style: GoogleFonts.poppins(fontSize: 18.0,fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 7.0,),
                    Text('76907854',
                      style: GoogleFonts.poppins(fontSize: 18.0,fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      width: 150.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextButton(
                                child: Text('Dossier'.toUpperCase(), style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlue),),
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MedecinAccueil()
                                  )
                                  );
                              },
                              )
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


//modeles
class Patient{
  String nom;
  String ville;
  String photo;

  Patient({required this.nom, required this.ville, required this.photo});
}



