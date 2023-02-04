import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListeHopitalTableau extends StatelessWidget {
  const ListeHopitalTableau({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
              horizontalMargin: 0,
              headingRowColor:
              MaterialStateColor.resolveWith((states) => HexColor('#54DEFC')),
              columns: [
                DataColumn(label: Text("Nom",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                ),
                DataColumn(label: Text("Téléphone",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                ),
                DataColumn(label: Text("Adresse",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                ),
                DataColumn(label: Text("Ville",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                ),
                DataColumn(label: Text("Medecin",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                ),
                DataColumn(label: Text("Etat",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                ),
                DataColumn(label: Text("Action",style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),),
                ),
              ],
              rows:  [
                AttributListeMedecin(),
                AttributListeMedecin(),
                AttributListeMedecin(),
                AttributListeMedecin(),

              ]),
        ),
      ],
    );
  }

  DataRow AttributListeMedecin() {
    return   DataRow(
        cells:[
          DataCell(Text("Mère et l'enfant",style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 18,)))),
          DataCell(Text("76589034",style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 18,)))),
          DataCell(Text("Hamdalaye",style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 18,)))),
          DataCell(Text("Bamako",style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 18,)))),
          DataCell(Text("509",style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 18,)))),
          DataCell(Icon(Icons.offline_pin_rounded,color: HexColor('54DEFC'))),
          DataCell(Row(
            children: [Icon
              (Icons.edit,color: HexColor('54DEFC'),
            ),
              Icon(Icons.delete,color:HexColor('EB455F'),
              ),
              Icon(Icons.remove_red_eye_outlined,color: HexColor('54DEFC'))

            ],
          )
          ),
        ] );
  }
}
