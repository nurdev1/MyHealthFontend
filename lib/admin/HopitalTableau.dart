/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../AllFile/global/LaisonBankend.dart';

class HopitalTableau extends StatefulWidget {
  @override
  _HopitalTableauState createState() => _HopitalTableauState();
}

class _HopitalTableauState extends State<HopitalTableau> {
  List<dynamic> hopitaux = [];

  @override
  void initState() {
    super.initState();
    fetchHopitaux();
  }

  Future<void> fetchHopitaux() async {
    final response = await http.get(Uri.parse('$masante+hopital/afficher'));
    if (response.statusCode == 200) {
      setState(() {
        hopitaux = json.decode(response.body);
      });
    }
  }

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
            columns: [
              DataColumn(
                label: Text(
                  "Nom",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DataColumn(
                label: Text(
                  "Téléphone",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DataColumn(
                label: Text(
                  "Adresse",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DataColumn(
                label: Text(
                  "Ville",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DataColumn(
                label: Text(
                  "Medecin",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DataColumn(
                label: Text(
                  "Etat",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DataColumn(
                label: Text(
                  "Action",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
            rows: hopitaux.map((hopital) {
              return DataRow(
                cells: [
                  DataCell(Text(
                    hopital['nom'],
                    style: TextStyle(fontSize: 18),
                  )),
                  DataCell(Text(
                    hopital['telephone'],
                    style: TextStyle(fontSize: 18),
                  )),
                  DataCell(Text(
                    hopital['adresse'],
                    style: TextStyle(fontSize: 18),
                  )),
                  DataCell(Text(
                    hopital['ville'],
                    style: TextStyle(fontSize: 18),
                  )),
                  DataCell(Text(
                    hopital['medecin'],
                    style: TextStyle(fontSize: 18),
                  )),
                  DataCell(Icon(
                    hopital['etat'] ? Icons.check : Icons.close,
                    color: hopital['etat'] ? Colors.green : Colors.red,
                  )),
                  DataCell(Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.green,
                      )
                    ],
                  )),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}*/

