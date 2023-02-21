import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'consultation/consultation.dart';

class MedecinHomeConsultation extends StatelessWidget {
  const MedecinHomeConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 200,
        //  color: Colors.amber,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 180,
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F8FF),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFF2F8FF),
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Patient:",
                                      style: GoogleFonts.openSans(
                                              textStyle: const TextStyle(fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black))
                                    ),
                                    Text(
                                      "Mohamed",
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black))
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Hôpital:",
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black))
                                    ),
                                    Text(
                                        "Golden",
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black))
                                    ),
                                  ],
                                ),
                                Text(
                                    "24/01/2023",
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black))
                                )

                              ],
                            ),)
                        ],
                      ),
                    )
                  ],
                );
              }
          )
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CreerConsultationPage()
        )
        );
      },
    );
  }
}
