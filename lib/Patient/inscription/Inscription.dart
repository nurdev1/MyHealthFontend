import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Patient.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';



import '../../admin/common/theme_helper.dart';
import '../../page/Connexion.dart';
import '../../widget/HeaderWidget.dart';

class Inscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Inscription();
  }
}

class _Inscription extends State<Inscription> {

  bool inLoginProcess = false;

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  ModelPatient _user = ModelPatient(
      email: '',
      nom: '',
      prenom: '',
      telephone: '');

 /* void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Envoyer les données de l'utilisateur à l'API ici.
      // Encoder les données de l'utilisateur en JSON.
      Map<String, dynamic> data = {
        "email": _user.email,
        "nom": _user.nom,
        "prenom": _user.prenom,
        "telephone": _user.telephone,
      };

      var jsonData = jsonEncode(data);
      print(jsonData);
      // Envoyer les données de l'utilisateur à l'API.
      http.post(Uri.parse('http://10.175.48.86:8082/patient/ajouter'),
          headers: {"Content-Type": "application/json"},
          body: jsonData).then((response) {
        if (response.statusCode == 200) {
          Map resp = json.decode(jsonData);
          ModelPatient modelPatient = ModelPatient.fromMap(resp);
          print("donner envoyer avec succes");
          return modelPatient;
          // Afficher un message de réussite ou rediriger l'utilisateur vers une autre page.

          *//*Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);*//*
          return btn1(context);
        } else {
          // Afficher une erreur.
          String jsonString = response.body;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);
          String message = jsonMap['message'];
          print(message);
          print(response.statusCode);
          //print(jsonDecode(response.body).);
          _displaySuccessMotionToast(message);
        }
      });
    }
  }*/

  void _displaySuccessMotionToast(context) {
    MotionToast.warning(
      title: const Text(
        'Alerte',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        '${context}',
        style: TextStyle(fontSize: 12),
      ),
      /*  layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,*/
      dismissable: false,
    ).show(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, Icons.person_add_alt_1_rounded, false),
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
                                  border: Border.all(
                                      width: 5, color: Colors.white),
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
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez numéro de téléphone';
                              }
                              return null;
                            },
                            onSaved: (value) => _user.prenom = value!,
                            decoration: ThemeHelper().textInputDecoration(
                                'Prenom', 'Entrez votre prénom'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez nom';
                              }
                              return null;
                            },
                            onSaved: (value) => _user.nom = value!,
                            decoration: ThemeHelper().textInputDecoration(
                                'Nom', 'Entrez votre nom '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onSaved: (value) => _user.email = value!,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Entrez votre email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) && !RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
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
                            /*  validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez numéro de téléphone';
                              }
                              return null;
                            },*/
                            onSaved: (value) => _user.telephone = value!,
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
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            /*  validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez mot de passe';
                              }
                              return null;
                            },*/
                            onSaved: (value) => _user.telephone = value!,
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
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)
                                        )
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .errorColor, fontSize: 12,),
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
                          decoration: ThemeHelper().buttonBoxDecoration(
                              context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  40, 10, 40, 10),
                              child: Text(
                                  "S'inscrire".toUpperCase(),
                                  style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)
                                  )
                              ),
                            ),
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              /* Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => MedecinProfile()
                                    ),
                                        (Route<dynamic> route) => false
                                );*/
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                               // _submit();
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                            "Ou créez un compte en utilisant les médias sociaux",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)
                            )),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /* IconButton(
                              icon: FontAwesomeIcons.googlePlus, size: 35,
                              color: HexColor("#EC2D2F"),
                              onPressed: () {
                                // ...
                              },
                            ),*/
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus, size: 35,
                                color: HexColor("#EC2D2F"),),
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
                              // onTap: () => signIn(context),
                              //onPressed: () => signIn(context),
                            ),
                            const SizedBox(width: 30.0,),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter, size: 23,
                                  color: HexColor("#FFFFFF"),),
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
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook, size: 35,
                                color: HexColor("#3E529C"),),
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

  //google inscription





  Widget btn1(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
                'Félicitations, votre inscription a été effectuée avec succès !'),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic> route) => false);
          },
          icon: Icon( // <-- Icon
            Icons.download,
            size: 24.0,
          ),
          label: Text('ok'), // <-- Text
        ),
      ],

    );
  }



  Widget btn2(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
                'Désolé, une erreur s\'est produite lors de l\'inscription. Veuillez vérifier vos informations et essayer à nouveau.'),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon( // <-- Icon
            Icons.download,
            size: 24.0,
          ),
          label: Text('ok'), // <-- Text
        ),
      ],

    );
  }
}


