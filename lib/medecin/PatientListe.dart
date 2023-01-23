import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/EntetePage.dart';
import 'MedecinProfil.dart';

class ListePatient extends StatelessWidget {
 // const ListePatient({Key? key}) : super(key: key);
  double _headerHeight =  100;

  @override
  Widget build(BuildContext context) {
    return  Material(
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
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 35,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MedecinProfil()
                          )
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 35,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => MedecinProfil()
                              )
                              );
                            },
                          ),
                         /* GestureDetector(
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
                          ),*/
                        ],
                      )

                    ],
                    ),
                      SizedBox(height: 30),
                      Text('Liste Patient',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      ListeSelect()

                    ],
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListeSelect extends StatelessWidget {
  const ListeSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 30,),


    );
  }
}
