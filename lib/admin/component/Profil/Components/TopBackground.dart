import 'package:flutter/material.dart';

import '../PlatformService.dart';


class TopBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
        width: _width,
        height: PlatFormServices.isMobile(context) ? 300 : 450,
        child: Image.asset('assets/images/profil.jpg', fit: BoxFit.cover));
  }
}
