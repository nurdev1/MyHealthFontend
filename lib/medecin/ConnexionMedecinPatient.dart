import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:masante/page/Choix.dart';
import 'package:masante/page/DossierList.dart';
import 'package:masante/service/connexion.dart';

import '../Patient/home/PatientNew.dart';
import '../admin/common/theme_helper.dart';
import '../widget/HeaderWidget.dart';

class ComptePatient extends StatefulWidget {
  const ComptePatient({Key? key}) : super(key: key);

  @override
  State<ComptePatient> createState() => _LoginPageState();
}

class _LoginPageState extends State<ComptePatient> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ConnexionService connexionService = ConnexionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, Icons.login_rounded, true),
            ),
            SafeArea(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                child: Column(
                  children: [
                    Text('Masante',
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                    Text('Acceder compte patient',
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                    SizedBox(
                      height: 30.0,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextFormField(
                                controller: usernameController,
                                validator: (value) => value!.isEmpty
                                    ? "veillez saisir le code patient"
                                    : null,
                                decoration: ThemeHelper().textInputDecoration(
                                    'code patient',
                                    'Entrer le code patient'),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) => value!.isEmpty
                                    ? "Veillez saisir votre mot de passe"
                                    : null,
                                controller: passwordController,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Mot de passe', 'Entrer votre password'),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style:  ElevatedButton.styleFrom(
                                  primary: HexColor('#54DEFC'),
                                  textStyle: const TextStyle(fontSize: 25),
                                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Se connecter'.toUpperCase(),
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))),
                                ),
                                onPressed: () async {
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  if (_formKey.currentState!.validate()) {
                                    signIn(usernameController.text,
                                        passwordController.text);
                                  }
                                },
                              ),
                            ),

                          ],
                        )),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  signIn(String codePatient, String password) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'codePatient': codePatient, 'password': password};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      'Accept': '*/*'
    };

    final msg = jsonEncode({"codePatient": codePatient, "password": password});

    var response = await http.post(
        Uri.parse('http://10.0.2.2:8082/patient/signin'),
        body: msg,
        headers: headers);
    jsonResponse = json.decode(response.body);

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    print('JSONREPONSE:${jsonResponse}');
    if (response.statusCode == 200) {
      setState(() {});
      /*sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
      sharedPreferences.setString("body", response.body);
      isLoggedIn
      sharedPreferences.setBool("isLoggedIn", true);*/
      var rol = json.decode(response.body);
      var firstname = json.decode(response.body);
      var lastname = json.decode(response.body);
      var nomUtilisateur = json.decode(response.body);
      var phone = json.decode(response.body);
      var mail = json.decode(response.body);
      roleuser = rol['roles'];
      nomUser = lastname['nom'];
      prenomUser = firstname['prenom'];
      nom = nomUtilisateur['username'];
      userTelehone = phone['telephone'];
      emailUser = mail['email'];

      print(roleuser);
      print(nomUser);
      print(prenomUser);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => DossierList()),
          (Route<dynamic> route) => false);

    } else {
      setState(() {});
      // sharedPreferences.setBool("isLoggedIn", false);
      print(response.body);
    }
  }
}
