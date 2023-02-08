import 'package:flutter/material.dart';

import '../PlatformService.dart';
import 'ProfileInFo.dart';


class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    /// card
    return Container(
        width: _width,
        margin: EdgeInsets.only(top: 70),
        padding: EdgeInsets.fromLTRB(
            10, PlatFormServices.isMobile(context) ? 80 : 20, 10, 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 5,
                  spreadRadius: 2)
            ]),child: ProfileInFo(),);
  }
}
