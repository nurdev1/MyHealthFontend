import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/responsive.dart';
import '../../style/colors.dart';
import '../../style/style.dart';


class HeaderDasboard extends StatelessWidget {
  const HeaderDasboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            child: Column(

              children: [
                Column(
                  children: [
                    PrimaryText(text: 'Tableau de bord',size: 30.0 ,fontWeight: FontWeight.w800,),
                    PrimaryText(text: 'le suivis',size: 16.0 ,fontWeight: FontWeight.w400, color: Colors.black,),
                  ],
                ),
              ],
            )
        ),
        Spacer(flex: 1,),
        Expanded(
          flex: Responsive.isDesktop(context) ? 1:3,
            child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.secondarBg,
              contentPadding: EdgeInsets.only(left: 40.0, right: 5.0),
              enabledBorder: OutlineInputBorder(borderRadius:
              BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColors.white),
              ),
              prefixIcon: Icon(Icons.search,color: Colors.black,),
              hintText: 'recherche',
              helperStyle: TextStyle(color: AppColors.secondarBg, fontSize: 14.0)
          ),
        )
        ),

      ],
    );
  }
}

