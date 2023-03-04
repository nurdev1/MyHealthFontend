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

    String _searchText = "";
    return Column(
      children: [
        SizedBox(
          child: FutureBuilder<List<ModelPatient>>(
            future: PatientService.getAllPatient(),
            builder: (BuildContext context, AsyncSnapshot<List<ModelPatient>> snapshot) {
              if (snapshot.hasData) {
                var liste = snapshot.data as List<ModelPatient>;
                return PaginatedDataTable(
                  //headingRowColor: MaterialStateColor.resolveWith((states) => HexColor('#54DEFC')),
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Code',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Nom',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Prénom',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
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
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Etat',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Action',
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

  final List<ModelPatient> _liste;

  @override
  DataRow? getRow(int index) {
    if (index >= _liste.length) {
      return null;
    }
    final patient = _liste[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(
            patient.username!,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 14,),
            ),
          ),
        ),
        DataCell(
          Text(
            patient.nom!,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 14,),
            ),
          ),
        ),
        DataCell(
          Text(
            patient.prenom!,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 14,),
            ),
          ),
        ),
        DataCell(Text(patient.telephone!, style: GoogleFonts.roboto(
            textStyle: const TextStyle(fontSize: 14,)
        ),)),
        DataCell(Text(patient.email!, style: GoogleFonts.roboto(
            textStyle: const TextStyle(fontSize: 14,)
        ),)),
       /* DataCell(Icon(Icons.offline_pin_rounded,
            color: HexColor('54DEFC'))),*/
           DataCell(
          Icon(
            patient.etat! ? Icons.offline_pin_rounded : Icons.offline_pin_rounded, // changer l'icone en fonction de l'etat du medecin
            color: patient.etat! ? HexColor('EB45F') : HexColor('54DEFC'), // changer la couleur de l'icone en fonction de l'etat du medecin
          ),
        ),
        /*   DataCell(
          Icon(
            patient.isDoctor ? Icons.offline_pin_rounded : Icons.online_pin_rounded, // changer l'icone en fonction de l'etat du medecin
            color: patient.isDoctor ? HexColor('EB45F') : HexColor('54DEFC'), // changer la couleur de l'icone en fonction de l'etat du medecin
          ),
        ),
*/

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

