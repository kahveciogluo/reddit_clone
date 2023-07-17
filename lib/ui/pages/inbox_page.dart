import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/widgets/left_drawer.dart';
import 'package:reddit_clone/ui/widgets/my_app_bar.dart';
import 'package:reddit_clone/ui/widgets/right_drawer.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final String pageName = 'Inbox';
  final GlobalKey<ScaffoldState> inboxPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: inboxPageScaffoldKey,
      drawer: const LeftDrawer(),
      endDrawer: const RightDrawer(),
      backgroundColor: AppColors.backgroundGrey,
      body: CustomScrollView(slivers: [
        MyAppBar(pageName: pageName, scaffoldKey: inboxPageScaffoldKey),
        SliverFixedExtentList(
          itemExtent: 500,
          delegate: SliverChildListDelegate([
            const Center(
              child: Text(
                'Under constraction',
                style: AppTextStyles.appBarBold,
              ),
            )
          ]),
        )
      ]),
    );
  }
}
