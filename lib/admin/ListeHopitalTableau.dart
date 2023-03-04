import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../modeles/Hopital.dart';
import '../service/Hopital.dart';

class ListeHopitalTableau extends StatefulWidget {
  const ListeHopitalTableau({Key? key}) : super(key: key);

  @override
  State<ListeHopitalTableau> createState() => _ListeHopitalTableauState();
}

class _ListeHopitalTableauState extends State<ListeHopitalTableau> {
  @override
    Widget build(BuildContext context) {
      List<Hopital> filterList(String searchText, List<Hopital> liste) {
        List<Hopital> filteredList = [];
        for (Hopital hopital in liste) {
          if (hopital.nom!.toLowerCase().contains(searchText.toLowerCase())) {
            filteredList.add(hopital);
          }
        }
        return filteredList;
      }

      String _searchText = "";
      return Column(

        children: [
        /*  TextFormField(
            decoration: InputDecoration(
              hintText: 'Rechercher',
            ),
            onChanged: (value){
              setState((){
                _searchText=value;
              });
            },
          ),*/
         /* Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 500,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: HexColor('#54DEFC').withOpacity(0.5),
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            decoration:  BoxDecoration(
                              color: HexColor('#54DEFC'),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)
                              ),

                            ),
                            child: Icon(Icons.search),
                          ),
                        )
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: HexColor('#54DEFC').withOpacity(0.5),
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            decoration:  BoxDecoration(
                              color: HexColor('#54DEFC'),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)
                              ),

                            ),
                            child: IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                // ...
                              },
                            ),
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),*/
          SizedBox(
            child: FutureBuilder<List<Hopital>>(
              future: HopitalService.getAllHopital(),
              builder: (BuildContext context, AsyncSnapshot<List<Hopital>> snapshot) {
                if (snapshot.hasData) {
                  var liste = snapshot.data as List<Hopital>;
                  var filteredList = filterList(_searchText, liste);
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
                          'Ville',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Adresse',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                        ),
                      ),
                      /*  DataColumn(
                      label: Text(
                        'Etat',
                        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20,)),
                      ),
                    ),*/
                      DataColumn(
                        label: Text(
                          'Action',
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 16,)),
                        ),
                      ),
                    ],
                    source: _PatientDataSource(filteredList),
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

  final List<Hopital> _liste;

  @override
  DataRow? getRow(int index) {
  if (index >= _liste.length) {
  return null;
  }
  final hopital = _liste[index];
  return DataRow.byIndex(
  index: index,
  cells: <DataCell>[
  DataCell(
  Text(
  hopital.nom!,
  style: GoogleFonts.roboto(
  textStyle: const TextStyle(fontSize: 14,),
  ),
  ),
  ),
  DataCell(
  Text(
  hopital.telephone!,
  style: GoogleFonts.roboto(
  textStyle: const TextStyle(fontSize: 14,),
  ),
  ),
  ),
  DataCell(
  Text(
  hopital.email!,
  style: GoogleFonts.roboto(
  textStyle: const TextStyle(fontSize: 14,),
  ),
  ),
  ),
  DataCell(Text(hopital.ville!, style: GoogleFonts.roboto(
  textStyle: const TextStyle(fontSize: 14,)
  ),)),
  DataCell(Text(hopital.adresse!, style: GoogleFonts.roboto(
  textStyle: const TextStyle(fontSize: 14,)
  ),)),
  /* DataCell(Icon(Icons.offline_pin_rounded,
            color: HexColor('54DEFC'))),*/
  /*  DataCell(
          Icon(
            hopital.etat! ? Icons.offline_pin_rounded : Icons.offline_pin_rounded, // changer l'icone en fonction de l'etat du medecin
            color: hopital.etat! ? HexColor('EB45F') : HexColor('54DEFC'), // changer la couleur de l'icone en fonction de l'etat du medecin
          ),
        ),*/
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