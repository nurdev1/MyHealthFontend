import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../style/colors.dart';


class ActionDashboard extends StatelessWidget {
  const ActionDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                    icon: Icon(Icons.notifications_outlined,
                      color: Colors.white,
                      size: 35,),
                  ),
                  SizedBox(width: 15.0,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/profil.jpg",),
                      ),
                      Icon(Icons.arrow_drop_down_outlined, color: AppColors.white,)
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

