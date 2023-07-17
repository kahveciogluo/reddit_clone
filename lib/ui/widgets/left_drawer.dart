import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/widgets/drawer_list_item.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({
    super.key,
  });

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  bool _showMenu = false;
  String drawerName = 'left';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      elevation: 0,
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Your Communites',
                            style: AppTextStyles.drawerMenuBold,
                          ),
                          Image.asset(
                              _showMenu
                                  ? 'assets/images/down_arrow.png'
                                  : 'assets/images/right_arrow.png',
                              height: 15,
                              width: 15,
                              color: AppColors.black),
                        ],
                      ),
                      onTap: () => setState(() {
                            _showMenu = !_showMenu;
                          })),
                  Visibility(
                    visible: _showMenu,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DrawerListItem(
                              text: 'Create a community',
                              iconPath:
                                  'assets/images/drawer_menu/create_comm.png',
                              drawerName: drawerName),
                          const SizedBox(height: 20),
                          DrawerListItem(
                              text: 'Custom Feeds',
                              iconPath:
                                  'assets/images/drawer_menu/custom_feeds.png',
                              drawerName: drawerName)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(height: 1.5, color: AppColors.grey),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerListItem(
                      text: 'Browse communities',
                      iconPath: 'assets/images/drawer_menu/browse_comm.png',
                      drawerName: drawerName),
                  const SizedBox(height: 20),
                  DrawerListItem(
                      text: 'All',
                      iconPath: 'assets/images/drawer_menu/all.png',
                      drawerName: drawerName)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum DrawerItem { createComm, customFeeds, browseComm, all }

extension DrawerItemExtension on DrawerItem {
  String get text {
    switch (this) {
      case DrawerItem.createComm:
        return 'Create a community';
      case DrawerItem.customFeeds:
        return 'Custom Feeds';
      case DrawerItem.browseComm:
        return 'Browse communities';
      case DrawerItem.all:
        return 'All';
      default:
        return '';
    }
  }

  String get iconPath {
    switch (this) {
      case DrawerItem.createComm:
        return 'assets/images/drawer_menu/create_comm.png';
      case DrawerItem.customFeeds:
        return 'assets/images/drawer_menu/custom_feeds.png';
      case DrawerItem.browseComm:
        return 'assets/images/drawer_menu/browse_comm.png';
      case DrawerItem.all:
        return 'assets/images/drawer_menu/all.png';
      default:
        return '';
    }
  }
}
