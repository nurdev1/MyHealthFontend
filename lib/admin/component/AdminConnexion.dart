import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Image.asset('assets/images/logo.png',width: 90,),
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
                        decoration: InputDecoration(
                          labelText: 'Adresse e-mail',
                          suffixIcon: Icon(FontAwesomeIcons.envelope,size: 17,)
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
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
                              HexColor('#54DEFC'),
                            ]
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Se connecter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
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
}
