import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../PlatformService.dart';
import '../ReUsableComponent/ReUsableButton.dart';
import '../ReUsableComponent/ReUsableText.dart';

class ProfileInFo extends StatelessWidget {
  String data =
      "Passionné de tout ce qui est de l'informatique, la nouvelle technologie et les Big data.";
  late bool isMobile;

  @override
  Widget build(BuildContext context) {
    isMobile = PlatFormServices.isMobile(context) ? true : false;
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              width: double.infinity,
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Spacer(flex: 1),
                SocialValue('Java', 22),
                SocialValue('web', 10),
                SocialValue('Flutter', 86),
                Spacer(flex: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon( // <-- Icon
                    Icons.edit,
                    size: 24.0,
                    color: HexColor('#54DEFC'),
                  ),
                  label: Text(''), // <-- Text
                ),
                Spacer(flex: 1)
              ])),
      /// card header
      SizedBox(height: isMobile ? 20 : 50), LargeBoldTextBlack('Fatoumata Kaloga'),
      SizedBox(height: 30),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_pin, size: 20, color: Colors.grey[400]),
            SizedBox(width: 5),
            NormalGreyText('Bamako')
          ]),
      SizedBox(height: 30),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.work, size: 20, color: Colors.grey[400]),
            SizedBox(width: 5),
            NormalGreyText('Développeuse full-stack')
          ]),
   /*   SizedBox(height: 10),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 20, color: Colors.grey[400]),
            SizedBox(width: 5),
            NormalGreyText('University of Computer Science')
          ]),*/

      /// description
      Divider(height: 30, thickness: 1, color: Colors.grey[300]),
      NormalGreyText(data),
    ]));
  }

  Widget SocialValue(String label, int value) => Container(
      padding: EdgeInsets.all(5),
      height: 50,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$value',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text(label,
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ]));
}
