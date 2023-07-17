import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/pages/drawer_item_page.dart';

class DrawerListItem extends StatelessWidget {
  final String text;
  final String iconPath;
  final String drawerName;

  const DrawerListItem(
      {super.key,
      required this.text,
      required this.iconPath,
      required this.drawerName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Image.asset(iconPath, height: 20, width: 20, color: AppColors.black),
          const SizedBox(width: 15),
          Text(text,
              style: drawerName == 'left'
                  ? AppTextStyles.drawerMenu
                  : AppTextStyles.drawerMenuBold)
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DrawerItemPage()),
        );
      },
    );
  }
}
