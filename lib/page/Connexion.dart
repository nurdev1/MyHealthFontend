import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:masante/page/Choix.dart';
import 'package:http/http.dart' as http;
import 'package:masante/service/connexion.dart';
import '../Patient/home/PatientNew.dart';
import '../admin/common/theme_helper.dart';
import '../medecin/AccueilMedecin.dart';
import '../widget/HeaderWidget.dart';
import 'MotdepasseOublier.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                     Text(
                      'Masante',
                      style:
                      GoogleFonts.openSans(
                          textStyle:  const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,color:Colors.black)
                      )
                    ),
                     Text(
                      'connexion à votre compte',
                      style:  GoogleFonts.openSans(
                          textStyle:  const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,color:Colors.black)
                      )
                    ),
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
                                validator: (value) =>
                                    value!.isEmpty ? "veillez saisir un nom" : null,
                                decoration: ThemeHelper().textInputDecoration(
                                    'nom utilisateur',
                                    'Entrer votre utilisateur'),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) =>
                                    value!.isEmpty ? "Veillez saisir votremot de passe" : null,
                                controller: passwordController,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Mot de passe', 'Entrer votre password'),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MotdepasseOublier()),
                                  );
                                },
                                child:  Text(
                                  "Mot de passe oublier?",
                                  style:  GoogleFonts.openSans(
                                      textStyle:  const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,color:Colors.grey)
                                  ),
                                  ),
                                ),
                              ),

                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Se connecter'.toUpperCase(),
                                    style:  GoogleFonts.openSans(
                                        textStyle:  const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,color:Colors.white)
                                    )
                                  ),
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
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(text: "Vous n'avez pas de compte ? "),
                                TextSpan(
                                  text: 'Inscription',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChoixPage()));
                                    },
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor),
                                ),
                              ])),
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

  signIn(String username, String password) async {
     // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'username': username, 'password': password};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      'Accept': '*/*'
    };

    final msg = jsonEncode({"username": username, "password": password});

    var response = await http.post(
        Uri.parse('http://10.0.2.2:8082/api/auth/signin'),
        body: msg,
        headers: headers);
    jsonResponse = json.decode(response.body);

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    print('JSONREPONSE:${jsonResponse}');
    if (response.statusCode == 200) {
      setState(() {
      });
      /*sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
      sharedPreferences.setString("body", response.body);
      isLoggedIn
      sharedPreferences.setBool("isLoggedIn", true);*/
      var rol = json.decode(response.body);
      var firstname = json.decode(response.body);
      var lastname = json.decode(response.body);
      var nomUtilisateur = json.decode(response.body);
      roleuser = rol['roles'];
      nomUser = lastname['nom'];
      prenomUser = firstname['prenom'];
      nom = nomUtilisateur['username'];
      print(roleuser);
      print(nomUser);
      print(prenomUser);
      Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => PatientFirst()), (Route<dynamic> route) => false);

     // if(){
     //   Navigator.of(context).pushAndRemoveUntil(
     //       MaterialPageRoute(builder: (BuildContext context) => PatientFirst()),
     //           (Route<dynamic> route) => false);
     //
     // }
     // else{
     //
     //   Navigator.of(context).pushAndRemoveUntil(
     //       MaterialPageRoute(builder: (BuildContext context) => MedecinAccueil()),
     //           (Route<dynamic> route) => false);
     // }
    } else {
      setState(() {
      });
      // sharedPreferences.setBool("isLoggedIn", false);
      print(response.body);
    }
  }
}
