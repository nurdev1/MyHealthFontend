import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:masante/modeles/Utilisateur.dart';
import 'package:masante/service/Hopital.dart';

class HopitalDialog {
  User? user;
  HopitalDialog({this.user});

  // pour visualiser la boite de dialogue
/*  void showCarDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    final _keyForm = GlobalKey<FormState>();
    String _carName = '';
    String _formError = "Veillez fournir le nom d'hôpital svp!";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final mobilHeight = MediaQuery.of(context).size.height * 0.25;
          final webHeight = MediaQuery.of(context).size.height * 0.5;
          return SimpleDialog(
            contentPadding: EdgeInsets.zero,
            children: [
              Container(
                height: kIsWeb ? webHeight : mobilHeight,
                margin: EdgeInsets.all(8.0),
                color: Colors.grey,
                child: kIsWeb
                    ? Image(
                        image: NetworkImage(_file.path),
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: FileImage(_file),
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Form(
                      key: _keyForm,
                      child: TextFormField(
                        maxLength: 20,
                        onChanged: (value) => _carName = value,
                        validator: (value) =>
                            _carName == '' ? _formError : null,
                        decoration: InputDecoration(
                          labelText: "Nom de l'hôpital",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('ANNULER'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => ServiceHopital.ajouterHopital(context, _keyForm, _file,
                                _pickedFile, _carName, user),
                            child: Text('PUBLIER'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }*/


}
