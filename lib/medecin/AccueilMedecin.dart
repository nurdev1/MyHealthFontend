import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widget/EntetePage.dart';
import 'MedecinProfil.dart';

class MedecinAccueil extends StatelessWidget {
 // const MedecinAccueil({Key? key}) : super(key: key);
  double _headerHeight =  160;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            height: _headerHeight,
            child: EnteteWidhet(_headerHeight,  false),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 30,
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
                      SizedBox(height: 5),
                      Text(
                        "Salut Dr Fatoumata",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           "Retrouver à tout moment \nvos dossier patient",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 18,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ],
                     )
                    ],
                  ),
                ),

        ],

          ),
    )
   ] ));

  }
}
