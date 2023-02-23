import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AllFile/style/colors.dart';



class ActionDashboard extends StatelessWidget {
  const ActionDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, color: Colors.white,),

        ),
       /* SizedBox(width: 10.0,),
        IconButton(
            onPressed: () {},
            icon: Image.asset('images/notetif.png',
              width: 20.0,)
        ),*/
        SizedBox(width: 15),
        Row(children: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('assets/images/profil.jpg'),
          ),
          Icon(Icons.arrow_drop_down_outlined, color: AppColors.white,)
        ]),
      ],
    );
  }
}

