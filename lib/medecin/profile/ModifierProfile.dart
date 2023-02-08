import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/medecin/MedecinProfil.dart';
import 'package:masante/medecin/profile/profile_page.dart';

class ModifierProfilMedecin extends StatelessWidget {
 // const ModifierProfil({Key? key}) : super(key: key);
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("54DEFC"),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => MedecinProfile()
            )
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text('Modifier Profile',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(height: 15,),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0,10),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/profil.jpg"),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                        child: Container(
                          height: 40,
                        width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: HexColor("54DEFC"),
                            ),
                            color: HexColor("54DEFC"),
                          ),
                          child: Icon(Icons.edit,color: Colors.white,),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 35,),
              buildText("Nom", "Kaloga",false),
              buildText("Prénom", "Fatoumata",false),
              buildText("Numéro", "76349804",false),
              buildText("Adresse", "ACI 200",false),
              buildText("Mot de passe", "*****",true),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.extended(
                    label: Text('Anuller',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                    ),
                    )
                    , // <-- Text
                    backgroundColor:HexColor("EB455F"),
                    icon: Icon( // <-- Icon
                      Icons.cancel,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  FloatingActionButton.extended(
                    label: Text('Enregistrer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                    , // <-- Text
                    backgroundColor:HexColor("54DEFC"),
                    icon: Icon( // <-- Icon
                      Icons.save,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


  Widget buildText(String labelText, String placehoder, bool isPasswordText) {
  bool showPassword = false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isPasswordText ? showPassword:false,
        decoration: InputDecoration(
          suffixIcon: isPasswordText ? IconButton(
            onPressed: (){
            /*  setState( (){
                showPassword = !showPassword;
              });*/
            },
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
          ) : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: "Nom",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Kaloga",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
      ),
    );
  }

