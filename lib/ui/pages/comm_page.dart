import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/widgets/left_drawer.dart';
import 'package:reddit_clone/ui/widgets/my_app_bar.dart';
import 'package:reddit_clone/ui/widgets/right_drawer.dart';

class CommPage extends StatefulWidget {
  const CommPage({super.key});

  @override
  State<CommPage> createState() => _CommPageState();
}

class _CommPageState extends State<CommPage> {
  final String pageName = 'Communities';

  final GlobalKey<ScaffoldState> commPageScaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: commPageScaffoldKey,
      drawer: const LeftDrawer(),
      endDrawer: const RightDrawer(),
      backgroundColor: AppColors.backgroundGrey,
      body: CustomScrollView(slivers: [
        MyAppBar(pageName: pageName, scaffoldKey: commPageScaffoldKey),
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
