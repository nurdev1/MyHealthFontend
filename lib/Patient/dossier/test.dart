import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';

import '../../modeles/Consultation.dart';


class AjouterDispensationPage extends StatefulWidget {
  @override
  _AjouterDispensationPageState createState() =>
      _AjouterDispensationPageState();
}

class _AjouterDispensationPageState extends State<AjouterDispensationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DateTime _date;
  late ConsultationModele _consultation;
 // late Uint8List _fichier ;
  Uint8List _fichier = Uint8List(0);
  DateTime? dateChosie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une dispensation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nomController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                  validator: (value) {
                    if (value!.isEmpty!) {
                      return 'Veuillez saisir le nom.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value!.isEmpty!) {
                      return 'Veuillez saisir la description.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text('Date de la dispensation'),
                SizedBox(height: 8.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dateChosie == null
                          ? ""
                          : DateFormat('EEE, d MMMM y').format(dateChosie!)),
                      // Text(dateChosie == null ? "Aucune date choisie": DateFormat('EEE, d MMMM y').format(dateChosie!) ),
                      //DateFormat('EEE, d MMMM y', 'fr_FR').format(dateChosie!)
                      TextButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2018),
                                    lastDate: DateTime.now())
                                .then((value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                dateChosie = value;
                              });
                            });
                          },
                          child: Text(
                            "Choisir une date",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#54DEFC'))),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text('Consultation associée'),
                SizedBox(height: 8.0),
                // Ajoutez ici votre widget pour sélectionner une consultation
                SizedBox(height: 16.0),
                TextButton(
                  child: Text(_fichier != null
                ? 'Fichier sélectionné'
                    : 'Téléverser un fichier'),

            onPressed: () async {
                    final fichier = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );
                    if (fichier != null) {
                      setState(() {
                        _fichier = fichier.files.single.bytes!;
                      });
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextButton(
                    child: Text('Enregistrer'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String nom = _nomController.text;
                        String description = _descriptionController.text;
                        DateTime date = _date;
                        ConsultationModele consultation = _consultation;
                        Uint8List fichier = _fichier;
                        String retour =
                            /*(await DispensationService.addDispensationModel(
                                fichier, nom, description, date, consultation));*/
                        _nomController.text = '';
                        _descriptionController.text = '';
                        print(retour);
                        print("okkkkkkk");
                      }

                      //await dispensation.enregistrerPieceJointe(_fichier);
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _confirmerEnvoi() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // utilisateur doit cliquer sur un bouton pour fermer la boîte de dialogue
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez-vous vraiment envoyer ce fichier ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Envoyer'),
              onPressed: () async {
                // ajoutez ici votre code pour envoyer le fichier
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

/*ElevatedButton(
child: Text(_fichier.isNotEmpty ? 'Fichier sélectionné' : 'Téléverser un fichier'),
onPressed: () async {
final fichier = await FilePicker.platform.pickFiles(
type: FileType.custom,
allowedExtensions: ['pdf'],
);
if (fichier != null) {
setState(() {
_fichier = fichier.files.single.bytes!;
});
await _confirmerEnvoi(); // afficher la boîte de dialogue de confirmation
}
},
),*/
