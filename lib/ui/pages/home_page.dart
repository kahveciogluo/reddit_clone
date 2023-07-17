import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/blocs/post/post_bloc.dart';
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/ui/widgets/left_drawer.dart';
import 'package:reddit_clone/ui/widgets/my_app_bar.dart';
import 'package:reddit_clone/ui/widgets/post_item.dart';
import 'package:reddit_clone/ui/widgets/right_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (_) => PostBloc()..add(const GetPosts()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _pageName = 'Home';
  final GlobalKey<ScaffoldState> _homePageScaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _homePageScaffoldKey,
        drawer: const LeftDrawer(),
        endDrawer: const RightDrawer(),
        backgroundColor: AppColors.backgroundGrey,
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            switch (state.status) {
              case PostStatus.failure:
                return const Center(child: Text('hata'));
              case PostStatus.success:
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<PostBloc>().add(const GetPosts());
                  },
                  child: CustomScrollView(
                    slivers: [
                      MyAppBar(
                          pageName: _pageName,
                          scaffoldKey: _homePageScaffoldKey),
                      state.posts.isNotEmpty
                          ? SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                              return PostItem(post: state.posts[index]);
                            }, childCount: state.posts.length))
                          : const Center(
                              child: Text('Hiç post yok'),
                            )
                    ],
                  ),
                );
              default:
                return Center(
                    child: Image.asset('assets/images/reddit_icon.png',
                        width: 36, height: 36));
            }
          },
        ));
  }
}
