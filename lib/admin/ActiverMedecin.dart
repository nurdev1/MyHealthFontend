import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:masante/service/Medecin.dart';

class ActiverMedecinButton extends StatelessWidget {
  final int id;

  ActiverMedecinButton({required this.id});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Activer le médecin'),
      onPressed: () {
        MedecinService.activerMedecin(id);
      },
    );
  }


}
/* Future<void> activerMedecin(int id) async {
    final response = await http.put(Uri.parse('$masante/medecin/$id/activer'));

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Succès'),
            content: Text('Le médecin a été activé avec succès.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (response.statusCode == 404) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Médecin non trouvé'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Erreur lors de l\'activation du médecin'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }*/
/*class ListeMedecinTableau extends StatelessWidget {
  final List<Medecin> medecins;

  ListeMedecinTableau({required this.medecins});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Text('ID'),
            Text('Nom'),
            Text('Statut'),
            Text('Actions'),
          ],
        ),
        for (var medecin in medecins)
          TableRow(
            children: [
              Text(medecin.id.toString()),
              Text(medecin.nom),
              Text(medecin.statut),
              ActiverMedecinButton(id: medecin.id),
            ],
          ),
      ],
    );
  }
}
*/