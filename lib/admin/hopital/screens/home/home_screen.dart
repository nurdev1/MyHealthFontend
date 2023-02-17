import 'package:flutter/material.dart';


import '../../../../responsive.dart';
import '../../../component/MenuAdmin.dart';
import '../../constants.dart';
import '../../models/Blog.dart';
import 'components/blog_post.dart';
import 'components/categories.dart';
import 'components/recent_posts.dart';
import 'components/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
        // Sidebar
        if (!Responsive.isMobile(context))
      /*    Expanded(
              flex:2,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(67),
                  ),
                  child: Menu())
          ),*/
        Expanded(
          flex: 2,
          child: Column(
            children: List.generate(
              blogPosts.length,
              (index) => BlogPostCard(blog: blogPosts[index]),
            ),
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
        // Sidebar
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                //Search(),
                //SizedBox(height: kDefaultPadding),
                //Categories(),
                //SizedBox(height: kDefaultPadding),
                //RecentPosts(),
              ],
            ),
          ),
      ],
    );
  }
}
