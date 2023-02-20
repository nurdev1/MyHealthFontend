import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Consultation.dart';

class PatientHomeConsultation extends StatelessWidget {
  const PatientHomeConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 140,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 100,
                      width: 200,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr Mohamed",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor("54DEFC")
                                  ),
                                ),
                                Text(
                                  "Cardiologue",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87.withOpacity(0.6),
                                  ),
                                ),
                                Text(
                                  "Golden",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87.withOpacity(0.6),
                                  ),
                                ),
                                Text(
                                  "24/01/2023",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87.withOpacity(0.6),
                                  ),
                                ),
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
            builder: (context) => ConsulationsListe()
        )
        );
      },
    );
  }
}
