import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../../../responsive.dart';
import '../../../constants.dart';
import '../../../models/Blog.dart';

class HopitalPostCard extends StatelessWidget {
  final HopitalAttribut hopitalAttribut;
  const HopitalPostCard({
    Key? key,
    required this.hopitalAttribut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.78,
            child: Image.asset(hopitalAttribut.image!),
          ),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Design".toUpperCase(),
                      style: TextStyle(
                        color: kDarkBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      hopitalAttribut.date!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    hopitalAttribut.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 32 : 24,
                      fontFamily: "Raleway",
                      color: kDarkBlackColor,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  hopitalAttribut.description!,
                  maxLines: 4,
                  style: TextStyle(height: 1.5),
                ),
                SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.only(bottom: kDefaultPadding / 4),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: kPrimaryColor, width: 3),
                          ),
                        ),
                        child: Text(
                          "iii",
                          style: TextStyle(color: kDarkBlackColor),
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon:Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                      Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
