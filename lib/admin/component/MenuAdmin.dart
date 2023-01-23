import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../config/size_config.dart';


class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      elevation: 0,
        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          color: Color(0xFF3BE5FC),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child:  Image.asset('images/m1.png'),
                  ),
                ),
                IconButton(
                  onPressed:() {},
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size:35.0,),
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                IconButton(
                  onPressed:() {},
                  icon: Icon(MdiIcons.hospital,
                    color: Colors.white,
                    size: 35,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                IconButton(
                  onPressed:() {},
                  icon: Icon(MdiIcons.doctor,
                    color: Colors.white,
                    size: 35,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                IconButton(
                  onPressed:() {},
                  icon: Icon(MdiIcons.naturePeople,
                    color: Colors.white,
                    size: 35,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                IconButton(
                  onPressed:() {},
                  icon: const Icon(
                    Icons.notification_important_outlined,
                    color: Colors.white,
                    size:35.0,),
                  iconSize: 20,

                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                IconButton(
                  onPressed:() {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size:35.0,),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),

                 SizedBox(height: 120,),
              IconButton(
                onPressed:() {},
                icon: Icon(MdiIcons.lanDisconnect,
                  color: Colors.white,
                  size: 35,),
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              ],),
          ),
        ),
    );
  }
}
