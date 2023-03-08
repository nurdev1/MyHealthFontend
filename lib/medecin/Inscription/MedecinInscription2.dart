import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:masante/medecin/AccueilMedecin.dart';

import 'package:masante/modeles/Medecin.dart';
import 'package:masante/page/Connexion.dart';
import 'package:masante/service/Hopital.dart';
import 'package:masante/service/Medecin.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../AllFile/global/LaisonBankend.dart';
import '../../admin/common/theme_helper.dart';
import '../../widget/HeaderWidget.dart';
import '../MedecinNew.dart';
import 'InscriptionMedecin.dart';
import 'Inscriptionvar.dart';

//List listes = ["Moussa", "Aliou", "hawa", "Fatoumata"];

class InscriptionMedecin1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InscriptionMedecin1();
  }
}

class _InscriptionMedecin1 extends State<InscriptionMedecin1> {
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
                                  builder: (context) => InscriptionMedecin()));
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
                        const SizedBox(
                          height: 130,
                        ),
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Entrez votre email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: telephoneController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Numéro téléphone",
                                "Entrez votre numéro de téléhone"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Entrez un numéro de téléphone valide";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "mot de passe*", "Entrer votre mot de passe"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "s'il vous plait entrez votre mot de passe";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "J'accepte tous les termes et conditions.",
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54)),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'Vous devez accepter les termes et conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
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
                                  "S'inscrire".toUpperCase(),
                                  style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)
                                  )
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String nom = nomController.text;
                                  String prenom = prenomController.text;
                                  String phone = telephoneController.text;
                                  String email = emailController.text;
                                  String username =usernameController.text;
                                  String specialite = specialiteController.text;
                                  String password = passwordController.text;
                                  String retour = await MedecinService.addMedecin( nom,email, phone, prenom, password,username,specialite);
                                  prenomController.text = '';
                                  emailController.text = '';
                                  telephoneController.text = '';
                                  nomController.text='';
                                  passwordController.text='';
                                  prenomController.text='';
                                  specialiteController.text='';
                                  usernameController.text='';
                                  print(retour);
                                  print("okkkkkkk");
                                  await Future.delayed(const Duration(milliseconds: 1000));
                                  await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: "Bonjour, Félicitations , votre inscription a été validée avec succès.",
                                  );
                                Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => First(),
                                  )
                                  );
                                }
                              }
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Text(
                          "Ou créez un compte en utilisant les médias sociaux",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus,
                                size: 35,
                                color: HexColor("#EC2D2F"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Google Plus",
                                          "Vous appuyez sur l'icône sociale GooglePlus.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 23,
                                  color: HexColor("#FFFFFF"),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Twitter",
                                          "Vous appuyez sur l'icône sociale Twitter.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                                color: HexColor("#3E529C"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Facebook",
                                          "Vous tapez on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                       /* Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(child: Text('Connexion',  style: GoogleFonts.openSans(
                                textStyle:  TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#EB455F')))),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage()));
                            },),
                          ],
                        ),*/
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          //child: Text('Don\'t have an account? Create'),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: "Vous avez un compte ? "),
                            TextSpan(
                              text: 'Connexion',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginPage()));
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ])),
                        ),

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