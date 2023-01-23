import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masante/admin/ProfilPanle.dart';
import 'package:masante/admin/TopBackground.dart';

import 'AdminHeader.dart';

class AdminProfil extends StatelessWidget {
  const AdminProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdde9e9),
      body: SafeArea(
        child: Stack(
          children: [
            TopBackground(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AdminHeader(),
                  ProfilePanle()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
