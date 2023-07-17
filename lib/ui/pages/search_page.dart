import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.black, //change your color here
        ),
        backgroundColor: AppColors.lightGrey,
        title: const Text(
          'Search Page',
          style: AppTextStyles.appBarBold,
        ),
      ),
      backgroundColor: AppColors.backgroundGrey,
      body: const Center(
        child: Text(
          'Under constraction',
          style: AppTextStyles.appBarBold,
        ),
      ),
    );
  }
}
