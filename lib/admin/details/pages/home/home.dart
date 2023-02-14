import 'package:flutter/material.dart';
import 'package:masante/admin/details/pages/home/widgets/desktop.dart';
import 'package:masante/admin/details/pages/home/widgets/mobile.dart';

import '../../helpers/responsive.dart';
import '../../helpers/style.dart';
import '../../widgets/drawer.dart';
import '../../widgets/navbar_desktop.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
    /*    key: scaffoldKey,
        appBar: ResponsiveWidget.isSmallScreen(context) ?
        mobileTopBar(scaffoldKey) :
        PreferredSize(preferredSize: Size(screenSize.width, 1000),
          child: NavBar(),),
        drawer: MobileMenu(),
        backgroundColor: bgColor,
        body: ResponsiveWidget(
          largeScreen: DesktopScreen(),
          smallScreen: MobileScreen(),
          mediumScreen: MobileScreen(),
        )*/);
  }
}
