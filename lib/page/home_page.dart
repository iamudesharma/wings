import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wings/page/posts/post_list_page.dart';
import 'package:wings/routes/routes.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AutoTabsScaffold(
      routes: const [
        PostsListRoute(),
        // CreatePostRoute(),
        UserAccountRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: Colors.green.shade300,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
