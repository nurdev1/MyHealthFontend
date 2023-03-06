import 'package:flutter/material.dart';
import 'package:masante/modeles/Hopital.dart';
import 'package:masante/service/Hopital.dart';


class HopitalTableau extends StatefulWidget {
  const HopitalTableau({Key? key}) : super(key: key);

  @override
  _HopitalTableauState createState() => _HopitalTableauState();
}

class _HopitalTableauState extends State<HopitalTableau> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hopital>>(
      future: HopitalService.getAllHopital(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Hopital>> snapshot) {
        if (snapshot.hasData) {
          var liste = snapshot.data as List<Hopital>;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Nom',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ville',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Téléphone',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                snapshot.data!.length,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(liste[index].nom!)),
                    DataCell(Text(liste[index].ville!)),
                    DataCell(Text(liste[index].adresse!)),
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
