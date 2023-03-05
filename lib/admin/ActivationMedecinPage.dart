import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Medecin.dart';

import '../service/Medecin.dart';
import 'ActiverMedecin.dart';

class ActivationMedecinPage extends StatelessWidget {
  final List<MedecinModel> medecins;

  ActivationMedecinPage({required this.medecins});

  @override
  Widget build(BuildContext context) {

    String _searchText = "";
    return Column(
      children: [
        SizedBox(
          // width: double.infinity/2,
          child: FutureBuilder<List<MedecinModel>>(
            future: MedecinService.getAllMedecin(),
            builder: (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot) {
              if (snapshot.hasData) {
                var liste = snapshot.data as List<MedecinModel>;
                return PaginatedDataTable(
                  //headingRowColor: MaterialStateColor.resolveWith((states) => HexColor('#54DEFC')),
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Nom',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Prenom',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Nom Utilisateur',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Téléphone',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Email',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Spécialité',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Statut',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                  ],
                  source: _PatientDataSource(liste),
                  rowsPerPage: 4,
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

class _PatientDataSource extends DataTableSource {
  _PatientDataSource(this._liste);

  final List<MedecinModel> _liste;

  @override
  DataRow? getRow(int index) {
    if (index >= _liste.length) {
      return null;
    }
    final medecin = _liste[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(
            medecin.nom!,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 14,),
            ),
          ),
        ),
        DataCell(
          Text(
            medecin.prenom!,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 14,),
            ),
          ),
        ),
        DataCell(Text(medecin.username!, style: GoogleFonts.roboto(
            textStyle: const TextStyle(fontSize: 14,)
        ),)),
        DataCell(
          Text(
            medecin.telephone!,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 14,),
            ),
          ),
        ),
        DataCell(
          Text(
            medecin.email!,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 14,),
            ),
          ),
        ),
        DataCell(Text(medecin.specialite!, style: GoogleFonts.roboto(
            textStyle: const TextStyle(fontSize: 14,)
        ),)),
        DataCell(
          Icon(
            medecin.etat! ? Icons.offline_pin_rounded : Icons.offline_pin_rounded, // changer l'icone en fonction de l'etat du medecin
            color: medecin.etat! ? HexColor('EB45F') : HexColor('54DEFC'), // changer la couleur de l'icone en fonction de l'etat du medecin
          ),
        ),

      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount=> _liste.length;

  @override
  int get selectedRowCount => 0;
  List<DataRow> getRowKist() =>
      List.generate(rowCount, (index) => getRow(index)!);

}