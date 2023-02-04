import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Patient/MenuPatient.dart';
import '../widget/EntetePage.dart';
import 'MedecinProfil.dart';

class MedecinAccueil extends StatelessWidget {
 // const MedecinAccueil({Key? key}) : super(key: key);
  double _headerHeight =  100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          /*  title: Text("Profile Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),*/
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
                                  builder: (context) => MedecinProfil()
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
      body: Stack(
        children: [
          Container(
            height: _headerHeight,
            child: EnteteWidhet(_headerHeight,  false),
          ),
   ] ));

  }
}
