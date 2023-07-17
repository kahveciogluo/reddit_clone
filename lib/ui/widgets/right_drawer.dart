import 'package:flutter/material.dart' hide Color;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/ui/widgets/drawer_list_item.dart';

class RightDrawer extends StatelessWidget {
  const RightDrawer({super.key});

  final String drawerName = 'right';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 20),
                width: 120,
                height: 150,
                decoration: const BoxDecoration(
                    color: AppColors.backgroundGrey,
                    image: DecorationImage(
                        scale: 5.0,
                        image: AssetImage('assets/images/reddit_icon.png')),
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(height: 1.5, color: AppColors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: DrawerListItem(
                  text: 'My Profile',
                  iconPath: 'assets/images/drawer_menu/all.png',
                  drawerName: drawerName),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: DrawerListItem(
                  text: 'Create a community',
                  iconPath: 'assets/images/drawer_menu/create_comm.png',
                  drawerName: drawerName),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: DrawerListItem(
                  text: 'Vault',
                  iconPath: 'assets/images/drawer_menu/all.png',
                  drawerName: drawerName),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: DrawerListItem(
                  text: 'Reddit Coins',
                  iconPath: 'assets/images/drawer_menu/all.png',
                  drawerName: drawerName),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: DrawerListItem(
                  text: 'Reddit Premium',
                  iconPath: 'assets/images/drawer_menu/all.png',
                  drawerName: drawerName),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: DrawerListItem(
                  text: 'Saved',
                  iconPath: 'assets/images/drawer_menu/all.png',
                  drawerName: drawerName),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: DrawerListItem(
                  text: 'History',
                  iconPath: 'assets/images/drawer_menu/all.png',
                  drawerName: drawerName),
            ),
          ],
        ),
      ),
    );
  }
}
