import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:masante/Patient/profile/user_preferences.dart';

import 'user.dart';
import 'widget/appbar_widget.dart';
import 'widget/button_widget.dart';
import 'widget/numbers_widget.dart';
import 'widget/profile_widget.dart';


class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GestureDetector(
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/user.png",),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PatientProfilePage()
              )
              );
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          //Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(UsersPatient user) => Column(
        children: [
          Text(
           ' $nomUser' ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            '$prenomUser',
            style: TextStyle(color: Colors.grey),
          )
        ],
      );


  Widget buildAbout(UsersPatient user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nom utilisateur',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '$nom',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            SizedBox(height: 16,),
            Text(
              'Telethone',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '$userTelehone',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const Text(
              'email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '$emailUser',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            SizedBox(height: 16,),
            SizedBox(height: 30,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               IconButton(
                 iconSize: 45,
                 icon: const Icon(Icons.edit,color: Colors.blue,),
                 onPressed: () {
                   // ...
                 },
               ),
               IconButton(
                 iconSize: 45,
                 icon: const Icon(Icons.delete,color: Colors.blue),
                 onPressed: () {
                   // ...
                 },
               ),
             ],
           )
          ],
        ),
      );
}
