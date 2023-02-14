import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'sidebar_container.dart';

class Hopitalinfo extends StatelessWidget {
  const Hopitalinfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "Hôpital du Mali",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Category(
            title: 'Ville',
            numOfItems: 4,
            press: () {},
          ),
          Category(
            title: 'Bamako',
            numOfItems: 10,
            press: () {},
          ),
          Category(
            title: 'Medecins',
            numOfItems: 18,
            press: () {},
          ),
          Category(
            title: '56',
            numOfItems: 12,
            press: () {},
          ),
          Category(
            title: '67985654',
            numOfItems: 8,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String title;
  final int numOfItems;
  final VoidCallback press;
  const Category({
    Key? key,
    required this.title,
    required this.numOfItems,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      child: TextButton(
        onPressed: () {},
        child: Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(color: kDarkBlackColor),
            children: [
              TextSpan(
                text: " ($numOfItems)",
                style: TextStyle(color: kBodyTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
