import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/ui/widgets/left_drawer.dart';
import 'package:reddit_clone/ui/widgets/my_app_bar.dart';
import 'package:reddit_clone/ui/widgets/right_drawer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final String pageName = 'Chat';
  final GlobalKey<ScaffoldState> chatPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: chatPageScaffoldKey,
      drawer: const LeftDrawer(),
      endDrawer: const RightDrawer(),
      backgroundColor: AppColors.backgroundGrey,
      body: CustomScrollView(slivers: [
        MyAppBar(pageName: pageName, scaffoldKey: chatPageScaffoldKey),
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
