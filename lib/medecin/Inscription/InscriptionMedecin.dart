import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/page/Choix.dart';

import '../../admin/common/theme_helper.dart';

import '../../widget/HeaderWidget.dart';
import 'Inscriptionvar.dart';
import 'MedecinInscription2.dart';

class InscriptionMedecin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InscriptionMedecin();
  }
}

class _InscriptionMedecin extends State<InscriptionMedecin> {




  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 250,
              child: HeaderWidget(250, Icons.person_add_alt_1_rounded, false),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChoixPage()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 180,
                        ),
                        Container(
                          child: TextFormField(
                            controller: prenomController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Prenom', 'Entrez votre prénom'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: nomController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Nom', 'Entrez votre nom '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: usernameController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez utilisateur';
                              }
                              return null;
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                'num utilisateur', 'Entrez votre utilisateur '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: specialiteController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez votre spécialité';
                              }
                              return null;
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                'Spécialité', 'Entrez votre spécialité '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor('#54DEFC'),
                              textStyle: const TextStyle(fontSize: 25),
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            child: Text(
                                "Suivant".toUpperCase(),
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white)
                                )
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => InscriptionMedecin1()
                                    ),
                                        (Route<dynamic> route) => false
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


