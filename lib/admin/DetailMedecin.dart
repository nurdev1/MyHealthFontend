import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../medecin/MedecinProfil.dart';

class DetailMedecin extends StatefulWidget {
  const DetailMedecin({Key? key}) : super(key: key);

  @override
  State<DetailMedecin> createState() => _DetailMedecinState();
}

class _DetailMedecinState extends State<DetailMedecin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:HexColor('#54DEFC') ,
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 25,
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
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color:HexColor('#54DEFC').withOpacity(0.1) ,
            height: 500,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  constraints: BoxConstraints(maxHeight: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Bonjour Fatoumata',
                            style:TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 10,
                            ) ,
                          ),
                          //SizedBox(height: 50,),
                          Row(
                            children: [
                              Column(
                                children: const [
                                  Text("Dr Fatoumata",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),)
                                ],
                              ),
                              Spacer(),
                              Image.asset("assets/images/profil.jpg")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

