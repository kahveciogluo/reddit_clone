import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/pages/search_page.dart';

class MyAppBar extends StatefulWidget {
  final String pageName;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MyAppBar(
      {super.key, required this.pageName, required this.scaffoldKey});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      leading: IconButton(
        icon: Image.asset('assets/images/hamburger_menu.png',
            color: AppColors.black, width: 20, height: 20),
        onPressed: () => widget.scaffoldKey.currentState?.openDrawer(),
      ),
      title: widget.pageName != 'Home'
          ? Text(widget.pageName, style: AppTextStyles.appBarBold)
          : Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Home',
                    style: AppTextStyles.appBarBold,
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/images/down_arrow.png',
                      color: AppColors.black, width: 12, height: 12)
                ],
              ),
            ),
      actions: [
        IconButton(
          icon: Image.asset('assets/images/search.png',
              color: AppColors.black, width: 20, height: 20),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
        ),
        IconButton(
          icon: Image.asset('assets/images/reddit_icon.png',
              width: 20, height: 20),
          onPressed: () => widget.scaffoldKey.currentState?.openEndDrawer(),
        ),
      ],
    );
  }
}
