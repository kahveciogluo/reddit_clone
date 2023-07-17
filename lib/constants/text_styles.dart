import 'package:flutter/material.dart' hide Color;
import 'package:reddit_clone/constants/colors.dart';

typedef TS = TextStyle;

class AppTextStyles {
  static const bottomBarLight = TS(
      fontSize: 10,
      color: AppColors.white,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.normal);

  static const bottomBarDark = TS(
      fontSize: 10,
      color: AppColors.black,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.bold);

  static const drawerMenu = TS(
      fontSize: 12,
      color: AppColors.black,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.normal);

  static const drawerMenuBold = TS(
      fontSize: 12,
      color: AppColors.black,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.bold);

  static const appBarBold = TS(
      fontSize: 12,
      color: AppColors.black,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.bold);

  static const postItemBlack = TS(
      fontSize: 12,
      color: AppColors.black,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.normal);

  static const postItemGrey = TS(
      fontSize: 12,
      color: AppColors.grey,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.normal);

  static const postItemGreySmall = TS(
      fontSize: 10,
      color: AppColors.grey,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.normal);

  static const postItemTitle = TS(
      fontSize: 14,
      color: AppColors.black,
      fontFamily: 'Verdana',
      fontWeight: FontWeight.bold);
}
