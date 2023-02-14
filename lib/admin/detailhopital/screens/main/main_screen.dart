import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../../component/MenuAdmin.dart';
import '../../../component/Profil/Screens/ProfileScreen.dart';
import '../../constants.dart';
import '../../controllers/MenuController.dart';
import '../home/home_screen.dart';

class DetailHopitalPage extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:HexColor('#54DEFC') ,
        actions: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
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
                            builder: (context) => ProfileAdmin()
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
      key: _controller.scaffoldkey,
      //drawer: SideMenu(),
      body:SafeArea(
        child:  Row(
          children: [
            Expanded(
                flex:2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(67),
                    ),
                    child: Menu())
            ),
            Expanded(
              flex: 13,
              child:
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    constraints: BoxConstraints(maxWidth: kMaxWidth),
                    child: SafeArea(child: DetailHopital()),
                  ),
                ],
              ),
            ),)
          ],
        ),
      )
    );
  }
}
