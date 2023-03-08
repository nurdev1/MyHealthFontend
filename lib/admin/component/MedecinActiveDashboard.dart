import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/service/Medecin.dart';

import '../../AllFile/style/style.dart';
import '../../modeles/Medecin.dart';
import '../../responsive.dart';
import '../config/size_config.dart';
import '../data.dart';

class MedecinNouveau extends StatelessWidget {
  const MedecinNouveau({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MedecinModel>>(
      future: MedecinService.getDernierMedecin(),
      builder:
          (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot) {
        if (snapshot.hasData) {
          var liste = snapshot.data as List<MedecinModel>;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor:
              MaterialStateColor.resolveWith((states) => HexColor('#EB455F')),
              columns:  <DataColumn>[
                DataColumn(
                  label: Text(
                    'utilisateur',
                    style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),),
                ),
                DataColumn(
                  label: Text(
                    'Nom',
                    style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),),
                ),
                DataColumn(
                  label: Text(
                    'Prénom',
                    style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                  ),
                ),
              /*  DataColumn(
                  label: Text(
                    'date',
                    style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                  ),
                ),*/
                DataColumn(label: Text("Action",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),),
                ),
              ],
              rows: List<DataRow>.generate(
                snapshot.data!.length,
                    (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(liste[index].username!,style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 14,)
                    ),)),
                    DataCell(Text(liste[index].nom!,style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 14,)
                    ),)),
                    DataCell(Text(liste[index].prenom!,style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 14,)
                    ),)),
                    DataCell(Text(liste[index].email!,style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 14,)
                    ),)),
                  /*  DataCell(Text(liste[index].date.toString()!,style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 14,)
                    ),)),*/
                    DataCell(Icon(Icons.offline_pin_rounded,
                        color: HexColor('EB455F'))),
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
    );
  }
}
