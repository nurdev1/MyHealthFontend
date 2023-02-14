import 'package:flutter/material.dart';


import '../../../../../responsive.dart';
import '../../constants.dart';
import '../../models/Blog.dart';
import 'components/blog_post.dart';
import 'components/categories.dart';

class DetailHopital extends StatelessWidget {
  const DetailHopital({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: List.generate(
              blogPosts.length,
              (index) => HopitalPostCard(hopitalAttribut: blogPosts[index]),
            ),
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
        // Sidebar
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                Hopitalinfo(),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
      ],
    );
  }
}
