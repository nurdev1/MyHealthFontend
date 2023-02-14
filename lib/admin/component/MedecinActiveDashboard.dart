import 'package:flutter/material.dart';

import '../../AllFile/style/style.dart';
import '../../responsive.dart';
import '../config/size_config.dart';
import '../data.dart';

class MedecinNouveau extends StatelessWidget {
  const MedecinNouveau({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Responsive.isDesktop(context) ? Axis.vertical: Axis.horizontal,
      child: SizedBox(
        width: Responsive.isDesktop(context) ? double.infinity: SizeConfig.screenHeight,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(transactionHistory.length, (index) => 
          TableRow(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 10.0,bottom: 10.0,left: 20.0),
                child: CircleAvatar(
                  radius: 17,
                  backgroundImage:AssetImage('assets/images/profil.jpg'),
                ),
              ),
              PrimaryText(text: 'Mohamed Tumkara',size: 16,
                color: Colors.black87,
              ),
              PrimaryText(text: 'Hôpital du Mali',size: 16,
                color: Colors.black87,
              ),PrimaryText(text: 'Dentiste',size: 16,
                color: Colors.black87,
              ),


            ],
          ),
          ),
        ),
      ),
    );
  }
}
