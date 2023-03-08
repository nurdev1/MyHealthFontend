import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Patient/MenuPatient.dart';
import '../Patient/profile/profile_page.dart';
import 'PatientDetails.dart';


class PatientListePage extends StatefulWidget {
  const PatientListePage({Key? key}) : super(key: key);

  @override
  State<PatientListePage> createState() => _PatientListePageState();
}

class _PatientListePageState extends State<PatientListePage> {

  final instructors = PatilentInfos;
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
                            radius: 30,
                            backgroundImage: AssetImage("assets/images/me.png",),
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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget> [
         /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              IconButton(
                  onPressed: null, icon: Icon(Icons.arrow_back,color: Colors.black,)
              ),
              IconButton(
                  onPressed: null, icon: Icon(Icons.menu,color: Colors.black,)
              ),
            ],
          ),*/
         /* Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            'Liste Patient',
            style: GoogleFonts.poppins(
              fontSize: 25.0,
              fontWeight: FontWeight.w500
            ),

          ),
          ),*/
         /* Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: null, icon: Icon(Icons.search,color: Colors.black,),
              ),
              hintText: 'recherche',
              hintStyle: GoogleFonts.poppins(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                onPressed: null, icon: Icon(MdiIcons.filter,color: Colors.black,),
              ),
            ),
          ),
          ),*/
          Container(
            height: MediaQuery.of(context).size.height - 200.bitLength,
            child: GridView.count(
              crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 0.67,
            primary: false,
              children: <Widget> [
                ...instructors.map((e) {
                  return builPatientGrid(e);
                }).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
  builPatientGrid(Patient patient){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => PatientDetail(selectedPatient:patient,),
        )
        );
      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Stack(
          children:<Widget> [
            Container(
              height: 150.0,
              width: 100,
              color: Colors.transparent,
            ),
            Positioned(
              left: 30.0,
              top: 65.0,
              child: Container(
                height: 30.0,
                width: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.0,
                      color: Colors.grey.withOpacity(0.75),
                      offset: Offset(5,25),
                      spreadRadius: 12.0
                    )
                  ]
                ),
              ),
            ),
            Positioned(
              left: 12.0,
                top: 15.0,
                child: Hero(
                  tag:patient.photo,
                  child: Container(
                    height: 110.0,
                    width: 85.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      image: DecorationImage(
                        image: AssetImage(patient.photo),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                )
            ),
            Positioned(
              left: 22.0,
                top: 138,
                child: Column(
                  children:<Widget> [
                    Text(patient.nom,style: GoogleFonts.sourceSansPro(fontSize: 12.0),
                    ),
                    Row(
                      children: [
                        Text(patient.ville,style: GoogleFonts.sourceSansPro(fontSize: 11.0),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
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


var PatilentInfos = [
 Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
  Patient(nom: 'Mariam', ville: 'Bamako', photo: 'assets/images/profil.jpg'),
];
