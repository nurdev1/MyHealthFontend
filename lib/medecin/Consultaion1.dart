import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/Consultation.dart';

class CreerConsultationPage1 extends StatefulWidget {
  @override
  _CreerConsultationPage1State createState() => _CreerConsultationPage1State();
}

class _CreerConsultationPage1State extends State<CreerConsultationPage1> {
  final _formKey = GlobalKey<FormState>();
  String _titre = '';
  String _description = '';
  String _fichier = '';
  double _headerHeight = 220;

  final consultationApi = ConsultationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une consultation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un titre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _titre = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextButton(
                onPressed: () async {
                  FilePickerResult? result =
                  await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result.files.single.path!);
                    setState(() {
                      _fichier = file.path;
                    });
                  }
                },
                child: Text('Sélectionner un fichier'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  //  consultationApi.ajouterConsultation(_titre, _description, _fichier); // appel à la méthode d'ajout de consultation de l'API
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
