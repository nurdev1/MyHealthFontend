import 'package:flutter/material.dart';

import '../../widget/CategorieDossier.dart';
import '../../widget/EntetePage.dart';
import '../MenuPatient.dart';
import '../profile/profile_page.dart';

class PatientNew extends StatelessWidget {
//  const PatientNew({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: HexColor("54DEFC"),
      appBar: AppBar(
          title: Text("Mes dossiers",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.notifications),
                        GestureDetector(
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("assets/images/profil.jpg",),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PatientProfilePage()
                            )
                            );
                          },
                        ),
                      ],
                    )

                  ],
                ),
              ],
            ),
          )
        ],
      ),
      drawer: PatientMenu(),
      body: SingleChildScrollView(
        child: (
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CategorieDossier(image: 'assets/images/doc.png',text: 'Consultation',color: Colors.white),
                                  CategorieDossier(image: 'assets/images/research.png',text: 'Analyse',color: Colors.white),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CategorieDossier(image: 'assets/images/ana.png',text: 'Imagérie',color: Colors.white),
                                  CategorieDossier(image: 'assets/images/examination.png',text: 'Systhése',color: Colors.white),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CategorieDossier(image: 'assets/images/pro.png',text: 'Prescription',color: Colors.white),
                                  CategorieDossier(image: 'assets/images/traitement.png',text: 'Traitement',color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),
                      IconButton(
                        iconSize: 72,
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          // ...
                        },
                      ),
                    ],

                  )

        ),
      ),
    );
  }
}

