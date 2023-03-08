import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Medecin.dart';
import 'package:masante/service/Medecin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MedecinInformation extends StatelessWidget {
  const MedecinInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MedecinModel>>(
      future: MedecinService().getMedecinModel(),
      builder: (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot) {
        if (snapshot.hasData) {
          List<MedecinModel> medecins = snapshot.data!;
          return GridView.count(
            childAspectRatio: 0.85,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (MedecinModel medecin in medecins)
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/images/me.png",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Text(
                              "Dr "+medecin.prenom!,
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                  )),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              medecin.nom!,
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                medecin.specialite!,
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                    )),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                medecin.telephone!,
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

