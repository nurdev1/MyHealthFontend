import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Patient.dart';
import 'package:masante/service/Medecin.dart';
import 'package:masante/service/Patient.dart';

import '../../modeles/Medecin.dart';

class PatientAccueilListe extends StatelessWidget {
  const PatientAccueilListe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
     // color: Colors.black,
      child: FutureBuilder(
          future: PatientService().getPatientModel(),
          builder: ((BuildContext context,
              AsyncSnapshot<List<ModelPatient>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erreur : ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              print(
                  '-------------------------------------data--------------------------');
              print(data[1].toJson());
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      //child: Image.asset("assets/images/docteur${index + 1}.jpg",
                                      child: Image.asset(
                                        "assets/images/user.png",
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].nom!,
                                      style: GoogleFonts.openSans(
                                          textStyle:  TextStyle(fontSize: 12,
                                              fontWeight: FontWeight.normal,color: HexColor('#54DEFC'),)),
                                    ),
                                    Text(
                                      data[index].prenom!,
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
