import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/medecin/AccueilMedecin.dart';
import 'package:masante/medecin/profile/ModifierProfile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MedecinProfil extends StatelessWidget {
  const MedecinProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/images.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor('#54DEFC').withOpacity(0.9),
                      Colors.black.withOpacity(0),
                      Colors.white.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF2F8FF).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Center(
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: HexColor('#54DEFC'),
                                    size: 28,
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Patients",
                                style: GoogleFonts.openSans(
                                    textStyle: GoogleFonts.openSans(
                                        textStyle:  const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,color:Colors.white)
                                    )
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "45",
                                style: GoogleFonts.openSans(
                                    textStyle: GoogleFonts.openSans(
                                        textStyle:  const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,color:Colors.white)
                                    )
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Expérience",
                                style: GoogleFonts.openSans(
                                    textStyle: GoogleFonts.openSans(
                                        textStyle:  const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,color:Colors.white)
                                    )
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "10",
                                style: GoogleFonts.openSans(
                                    textStyle: GoogleFonts.openSans(
                                        textStyle:  const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,color:Colors.white)
                                    )
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Consultation",
                                style: GoogleFonts.openSans(
                                    textStyle: GoogleFonts.openSans(
                                        textStyle:  const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,color:Colors.white)
                                    )
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text("15",
                                  style: GoogleFonts.openSans(
                                      textStyle: GoogleFonts.openSans(
                                          textStyle:  const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,color:Colors.white)
                                      )
                                  ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Dr Fatoumata Sy",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: HexColor('#54DEFC')))
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Nom uilisateur",
                          style: GoogleFonts.openSans(
                              textStyle:  const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,color:Colors.black87))
                      ),
                      SizedBox(height: 10,),
                      Text("Fatou",
                        style: GoogleFonts.openSans(
                            textStyle:  const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,color:Colors.black87))
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: HexColor('#EB455F'),
                        size: 40,
                      ),
                      const SizedBox(
                        height: 5,
                        width: 30,
                      ),
                      Text("74467865",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black))),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: HexColor('#EB455F'),
                        size: 40,
                      ),
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
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.doctor,
                        color: HexColor('#EB455F'),
                        size: 40,
                      ),
                      SizedBox(
                        height: 5,
                        width: 30,
                      ),
                      Text("Cardiologue",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.hospital,
                        color: HexColor('#EB455F'),
                        size: 40,
                      ),
                      SizedBox(
                        height: 5,
                        width: 30,
                      ),
                      Text("Mére et L'enfant",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.city,
                        color: HexColor('#EB455F'),
                        size: 40,
                      ),
                      SizedBox(
                        height: 5,
                        width: 30,
                      ),
                      Text("Bamako",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ModifierProfilMedecin()
                        )
                        );
                      },
                        icon: Icon(Icons.edit,size: 50.0,color: HexColor('#54DEFC'),
                      ),
                      ),
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ModifierProfilMedecin()
                        )
                        );
                      },
                        icon: Icon(MdiIcons.delete,size: 50.0,color: HexColor('#EB455F'),
                      ),
                      )
                    ],
                  ),

                ],
              ),)
          ],
        ),
      ),
    );
  }
}
