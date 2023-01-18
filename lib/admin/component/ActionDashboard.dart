import 'package:flutter/material.dart';

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
                      icon: Image.asset('images/notetif.png',
                        width: 20.0,)
                  ),
                  SizedBox(width: 10.0,),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('images/notetif.png',
                        width: 20.0,)
                  ),
                  SizedBox(width: 15.0,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 17,
                        backgroundImage: NetworkImage('images/profil.jpg'),
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

