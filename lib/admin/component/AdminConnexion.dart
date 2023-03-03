import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/admin/Dashboard.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AllFile/global/LaisonBankend.dart';
import '../../service/connexion.dart';
import 'package:http/http.dart' as http;

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    ConnexionService connexionService = ConnexionService();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    HexColor('#54DEFC'),
                    HexColor('#54DEFC'),
                    Color(0xFFE3F2FD)
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Image.asset('assets/images/Masante6.png',width: 90,),
              /* SizedBox(height: 15,),
              Text('Myhealth',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),*/
              SizedBox(height: 30,),
              Container(
                height: 450,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Text('Salut',
                      style: TextStyle(fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text('veuillez vous connecter à votre compte',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            labelText: 'Nom utilisatteur',
                            suffixIcon: Icon(FontAwesomeIcons.peopleArrows,size: 17,)
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            suffixIcon: Icon(FontAwesomeIcons.eyeSlash,size: 17,)
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Mot de passe oublier',
                            style:TextStyle(
                                color: Colors.lightBlue[700]
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  HexColor('#54DEFC'),
                                  HexColor('#54DEFC').withOpacity(0.5),
                                  HexColor('#54DEFC').withOpacity(0.9),
                                ]
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor('#54DEFC'), // Background color
                            ),
                            child: Text('Se connecter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            onPressed: (){
                              //After successful login we will redirect to profile page. Let's create profile page now
                              /* Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => Dashboard()));*/
                              signIn(usernameController.text,
                                  passwordController.text);
                            },
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('connexion avec les média scociaux',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(MdiIcons.google,color: HexColor('#EC2D2F') ),
                        Icon(MdiIcons.facebook,color: HexColor('#4267B2') ),
                        Icon(MdiIcons.github,color: HexColor('#00000')),
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
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
      var phone = json.decode(response.body);
      var mail =json.decode(response.body);
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
          MaterialPageRoute(builder: (BuildContext context) => Dashboard()), (Route<dynamic> route) => false);


    } else {
      setState(() {
      });
      // sharedPreferences.setBool("isLoggedIn", false);
      print(response.body);
    }
  }
}
