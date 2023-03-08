import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/Consultation.dart';
import 'package:masante/service/Consultation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';


import '../../AllFile/global/LaisonBankend.dart';
import '../../admin/common/theme_helper.dart';
import '../../widget/DateChoisirWidget.dart';
import '../../widget/EntetePage.dart';
import '../profile/MedecinProfil.dart';

class CreerConsultationPage extends StatefulWidget {
  @override
  _CreerConsultationPageState createState() => _CreerConsultationPageState();
}

class _CreerConsultationPageState extends State<CreerConsultationPage> {
  TextEditingController nomController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController patienController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _titre = '';
  String _description = '';
  String _fichier = '';
  double _headerHeight = 220;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            height: _headerHeight,
            child: EnteteWidhet(_headerHeight, false),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    "assets/images/user.png",
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MedecinProfil()));
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        " Dr $prenomUser ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 120),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Créer une consultation',
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#EB455F'))
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
               /* SizedBox(
                  height: 15,
                ),*/
              /*  Text(
                  'Gérer vos different consultation de vos patients',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#EB455F'))),
                ),*/
                /*SizedBox(
                  height: 20,
                ),*/
                SafeArea(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: TextFormField(
                                  controller: patienController,
                                  decoration:
                                      InputDecoration(labelText: 'Patient'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer un Patient';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _titre = value!;
                                  },
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  controller: nomController,
                                  decoration:
                                      InputDecoration(labelText: 'Nom'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer un Nom';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _description = value!;
                                  },
                                ),
                              ),
                              Container(
                                // height: 200,
                                child: TextFormField(
                                  controller: descriptionController,
                                  decoration:
                                      InputDecoration(labelText: 'Description'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer une description';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _fichier = value!;
                                  },
                                ),
                              ),
                              SizedBox(height: 30,),
                              Container(
                                  child: Row(
                                    children: [
                                      ConsultationDateChoseWidget(),
                                    ],
                                  )
                              ),
                              TextButton(
                                onPressed: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    File file = File(result.files.single.path!);
                                    setState(() {
                                      _fichier = file.path;
                                    });
                                  }
                                },
                                child: Text('Sélectionner un fichier'),
                              ),

                              SizedBox(height: 30.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor('#54DEFC'),
                                    textStyle: const TextStyle(fontSize: 25),
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text("ajouter".toUpperCase(),
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white))),
                                  ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        String nom = nomController.text;
                                        String description = descriptionController.text;
                                        String patient = patienController.text;

                                        String retour = await ConsultationService.addConsultation(
                                            nom,  description,patient);
                                        patienController.text = '';
                                        descriptionController.text = '';
                                        nomController.text='';
                                        print(retour);
                                        print("okkkkkkk");
                                        await Future.delayed(const Duration(milliseconds: 1000));
                                        await QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.success,
                                          text: " information avec succès !!.",
                                        );
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => ConsulationsListe()
                                        )
                                        );

                                      }
                                    }
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

