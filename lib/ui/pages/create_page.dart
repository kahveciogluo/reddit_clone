import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/widgets/left_drawer.dart';
import 'package:reddit_clone/ui/widgets/my_app_bar.dart';
import 'package:reddit_clone/ui/widgets/right_drawer.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final String pageName = 'Create';
  final GlobalKey<ScaffoldState> createPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: createPageScaffoldKey,
      drawer: const LeftDrawer(),
      endDrawer: const RightDrawer(),
      backgroundColor: AppColors.backgroundGrey,
      body: CustomScrollView(slivers: [
        MyAppBar(pageName: pageName, scaffoldKey: createPageScaffoldKey),
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
