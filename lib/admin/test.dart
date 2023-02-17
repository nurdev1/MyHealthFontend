/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminListeHopitauxPage extends StatefulWidget {
  const AdminListeHopitauxPage({Key? key}) : super(key: key);

  @override
  _AdminListeHopitauxPageState createState() => _AdminListeHopitauxPageState();
}

class _AdminListeHopitauxPageState extends State<AdminListeHopitauxPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _adresseController = TextEditingController();
  final _villeController = TextEditingController();
  final _telephoneController = TextEditingController();

  Future<void> ajouterHopital() async {
    final nom = _nomController.text;
    final adresse = _adresseController.text;
    final ville = _villeController.text;
    final telephone = _telephoneController.text;

    try {
      final response = await http.post(
        Uri.parse('https://example.com/api/hopitaux'),
        body: {
          'nom': nom,
          'adresse': adresse,
          'ville': ville,
          'telephone': telephone,
        },
      );

      if (response.statusCode == 201) {
        // L'hôpital a été ajouté avec succès
        // Mettre à jour la liste des hôpitaux
      } else {
        throw Exception('Impossible d\'ajouter l\'hôpital');
      }
    } catch (e) {
      // Gérer l'erreur
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des hôpitaux'),
      ),
      body: Column(
        children: [
      Expanded(
      child: SingleChildScrollView(
      child: Column(
        children: [
        // Afficher la liste des hôpitaux
        ],
      ),
    ),
    ),
    ElevatedButton(
    onPressed: () {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: const Text('Ajouter un hôpital'),
    content: Form(
    key: _formKey,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    TextFormField(
    controller: _nomController,
    decoration: const InputDecoration(
    labelText: 'Nom',
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'Le nom est obligatoire';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _adresseController,
    decoration: const InputDecoration(
    labelText: 'Adresse',
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'L\'adresse est obligatoire';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _villeController,
    decoration: const InputDecoration(
    labelText: 'Ville',
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'La ville est obligatoire';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _telephoneController,
    decoration: const InputDecoration(
    labelText: 'Téléphone',
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return '*/


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masante/AllFile/global/LaisonBankend.dart';

class AjouterHopitalForm extends StatefulWidget {
    @override
    _AjouterHopitalFormState createState() => _AjouterHopitalFormState();
    }

    class _AjouterHopitalFormState extends State<AjouterHopitalForm> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nomController = TextEditingController();
    final TextEditingController _adresseController = TextEditingController();
    final TextEditingController _telephoneController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();

    @override
    Widget build(BuildContext context) {
    return Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    TextFormField(
    controller: _nomController,
    decoration: const InputDecoration(
    labelText: 'Nom',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Le champ Nom est obligatoire';
    }
    return null;
    },
    ),
    TextFormField(
    //controller: _adresseController,
    decoration: const InputDecoration(
    labelText: 'Adresse',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Le champ Adresse est obligatoire';
    }
    return null;
    },
    ),
    TextFormField(
    //controller: _telephoneController,
    decoration: const InputDecoration(
    labelText: 'Téléphone',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Le champ Téléphone est obligatoire';
    }
    return null;
    },
    ),
    TextFormField(
    //controller: _emailController,
    decoration: const InputDecoration(
    labelText: 'Email',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Le champ Email est obligatoire';
    }
    return null;
    },
    ),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: ElevatedButton(
    onPressed: () {
   /* if (_formKey.currentState!.validate()) {
    // Appeler votre API pour ajouter un nouvel hôpital à la base de données
    ajouterHopital(_nomController.text, _adresseController.text, _telephoneController.text, _emailController.text);
    Navigator.pop(context);
    }*/
    },
    child: const Text('Ajouter'),
    ),
    ),
    ],
    ),
    );
    }
    }


Future<void> ajouterHopital(String nom, String adresse, String telephone, String email) async {
  final response = await http.post(
    Uri.parse('$masante+hopital/ajouter'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nom': nom,
      'adresse': adresse,
      'telephone': telephone,
      'email': email,
    }),
  );

  if (response.statusCode == 201) {
    // Le nouvel hôpital a été ajouté avec succès
  } else {
    // Il y a eu une erreur lors de l'ajout de l'hôpital
    throw Exception('Failed to add hospital.');
  }
}
