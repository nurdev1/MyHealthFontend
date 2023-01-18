import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widget/ActiveChats.dart';
import '../widget/EntetePage.dart';
import '../widget/RecentChats.dart';

class ChatHome extends StatelessWidget {
 // const ChatHome({Key? key}) : super(key: key);
  double _headerHeight =  200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor:HexColor("54DEFC") ,
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.notifications_outlined),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage("assets/images/profil.jpg"),
          ),)
        ],
      ),
      body: ListView(children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child:Text("Avis", style: TextStyle(color: HexColor("54DEFC"),
              fontSize: 28,fontWeight: FontWeight.bold
          ),
          ) ,
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
               color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0,3),
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "recherche",
                    border: InputBorder.none,
                  ),
                ),
                ),
              ),
              Icon(Icons.search,
              color: HexColor("54DEFC"),
              )
            ],
          ),
        ),
        ),
        ActiveChats(),
        RecentChats(),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: HexColor("54DEFC"),
        child: Icon(Icons.message,color: Colors.white,),
      ),
    );
  }
}
