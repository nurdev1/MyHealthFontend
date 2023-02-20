import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masante/service/Hopital.dart';
import 'dart:convert';

import '../AllFile/global/LaisonBankend.dart';
import '../modeles/hopitalModel.dart';

class HopitalTableau extends StatefulWidget {
  const HopitalTableau({Key? key}) : super(key: key);

  @override
  _HopitalTableauState createState() => _HopitalTableauState();
}

class _HopitalTableauState extends State<HopitalTableau> {
  late Future<List<dynamic>> _futureHopitaux;

  @override
  void initState() {
    super.initState();
   // _futureHopitaux = fetchHopitaux();
  }

  /*Future<List<dynamic>> fetchHopitaux() async {
    final response = await http.get(Uri.parse("$masante+/hopital/afficher"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load hopitaux');
    }
  }*/



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HopitalsModel>>(
      future: HopitalService().getHopitalModel(),
      builder: (BuildContext context, AsyncSnapshot<List<HopitalsModel>> snapshot) {
        if (snapshot.hasData) {
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
                    'Adresse',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                snapshot.data!.length,
                    (index) => DataRow(
                  cells: <DataCell>[
                /*    DataCell(Text(snapshot.data![index]['nom'])),
                    DataCell(Text(snapshot.data![index]['ville'])),
                    DataCell(Text(snapshot.data![index]['adresse'])),*/
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
