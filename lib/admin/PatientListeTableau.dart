import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/service/Patient.dart';

import '../modeles/Patient.dart';

class ListePatientTableau extends StatelessWidget {
  const ListePatientTableau({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
         // width: double.infinity,
          child: FutureBuilder<List<ModelPatient>>(
            future: PatientService.getAllPatient(),
            builder:
                (BuildContext context, AsyncSnapshot<List<ModelPatient>> snapshot) {
              if (snapshot.hasData) {
                var liste = snapshot.data as List<ModelPatient>;
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
