import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../admin/config/size_config.dart';
import '../style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical,
      color: AppColors.secondarBg,
      child: SingleChildScrollView(
        child: Column (
          children: [
            Drawer(
              elevation: 0,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset('images/m1.png'),
                ),
              ),
            ),
            IconButton(onPressed:() {},
              icon: Image.asset('images/home.png'),
              iconSize: 20,
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            IconButton(onPressed:() {},
              icon: Image.asset('images/hopital.png'),
              iconSize: 20,
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            IconButton(onPressed:() {},
              icon: Image.asset('images/medecin.png'),
              iconSize: 20,
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            IconButton(onPressed:() {},
              icon: Image.asset('images/patient.png'),
              iconSize: 20,
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            IconButton(onPressed:() {},
              icon: Image.asset('images/notetif.png'),
              iconSize: 20,
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            IconButton(onPressed:() {},
              icon: Image.asset('images/param.png'),
              iconSize: 20,
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),


          ],),
      ),
    );
  }
}
