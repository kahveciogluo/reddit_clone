import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/pages/inbox_page.dart';
import 'package:reddit_clone/ui/pages/chat_page.dart';
import 'package:reddit_clone/ui/pages/home_page.dart';
import 'package:reddit_clone/ui/pages/comm_page.dart';
import 'package:reddit_clone/ui/pages/create_page.dart';

void main() {
  runApp(const RedditClone());
}

class RedditClone extends StatelessWidget {
  const RedditClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final double elevation = 25.0;
  int _pageIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    CommPage(),
    CreatePage(),
    ChatPage(),
    InboxPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _pageIndex,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.grey,
          selectedLabelStyle: AppTextStyles.bottomBarDark,
          unselectedLabelStyle: AppTextStyles.bottomBarLight,
          items: [
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/home.png',
                      width: 16, height: 16, color: AppColors.black),
                ),
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/home.png',
                      width: 16, height: 16, color: AppColors.grey),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/comm.png',
                      width: 16, height: 16, color: AppColors.black),
                ),
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/comm.png',
                      width: 16, height: 16, color: AppColors.grey),
                ),
                label: 'Communities'),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/create.png',
                      width: 16, height: 16, color: AppColors.black),
                ),
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/create.png',
                      width: 16, height: 16, color: AppColors.grey),
                ),
                label: 'Create'),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/chat.png',
                      width: 16, height: 16, color: AppColors.black),
                ),
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/chat.png',
                      width: 16, height: 16, color: AppColors.grey),
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/inbox.png',
                      width: 16, height: 16, color: AppColors.black),
                ),
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset('assets/images/bottom_menu/inbox.png',
                      width: 16, height: 16, color: AppColors.grey),
                ),
                label: 'Inbox')
          ]),
    );
  }
}
