import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/service/Medecin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../modeles/Medecin.dart';

class ListeMedecinTableau extends StatelessWidget {
  const ListeMedecinTableau({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    //  crossAxisAlignment: CrossAxisAlignment.center,
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: double.infinity,
          child: FutureBuilder<List<MedecinModel>>(
            future: MedecinService.getAllMedecin(),
            builder:
                (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot) {
              if (snapshot.hasData) {
                var liste = snapshot.data as List<MedecinModel>;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor:
                    MaterialStateColor.resolveWith((states) => HexColor('#54DEFC')),
                    columns:  <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Nom',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                      ),
                      DataColumn(
                        label: Text(
                          'Prénom',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Numéro',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Email',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Spécialité',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),
                        ),
                      ),
                      DataColumn(label: Text("Hôpital",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                      ),
                      DataColumn(label: Text("Etat",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                      ),
                      DataColumn(label: Text("Action",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      snapshot.data!.length,
                          (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(liste[index].nom!,style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18,)
                          ),)),
                          DataCell(Text(liste[index].prenom!,style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18,)
                          ),)),
                          DataCell(Text(liste[index].telephone!,style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18,)
                          ),)),
                          DataCell(Text(liste[index].email!,style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18,)
                          ),)),
                          DataCell(Text(liste[index].specialite!,style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18,)
                          ),)),
                          DataCell(Text(liste[index].prenom!,style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18,)
                          ),)),
                          DataCell(Icon(Icons.offline_pin_rounded,
                              color: HexColor('54DEFC'))),
                          DataCell(Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: HexColor('54DEFC'),
                              ),
                              Icon(
                                Icons.delete,
                                color: HexColor('EB455F'),
                              ),
                              Icon(Icons.remove_red_eye_outlined,
                                  color: HexColor('54DEFC'))
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
