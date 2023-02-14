import 'package:flutter/material.dart';

import '../Components/FooterPanel.dart';
import '../Components/HeaderPanel.dart';
import '../Components/ProfilePanle.dart';
import '../Components/TopBackground.dart';
import '../PlatformService.dart';


class ProfileAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// background color
        backgroundColor: Color(0xffdde9e9),

        /// if is it Mobile. don't use SafeArea
        body: PlatFormServices.isMobile(context)
            ? Stack(children: [
                TopBackground(),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [HeaderPanel(), ProfilePanle(), FooterPanel()]),
                )
              ])
            : SafeArea(
                child: Stack(children: [
                TopBackground(),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [HeaderPanel(), ProfilePanle(), FooterPanel()]),
                )
              ])));
  }
}
