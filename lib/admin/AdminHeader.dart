import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../medecin/MedecinProfil.dart';
import 'PlatformService.dart';

class AdminHeader extends StatelessWidget {
//  const AdminHeader({Key? key}) : super(key: key);
  late bool isMobile;
  @override
  Widget build(BuildContext context) {
    isMobile = PlatFormServices.isMobile(context) ? true : false;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: HexColor('#54DEFC'),
        padding: EdgeInsets.symmetric(
            horizontal: _width / 10, vertical: isMobile ? 30 : 10),
        child: isMobile
            ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ RightSidePanle()],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ RightSidePanle()],
        ));
  }



  Widget RightSidePanle() =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        /*GestureDetector(
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
      ]);
}
