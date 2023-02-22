import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/input_field_data.dart';

class AppResources {
  static var screenMargin = const EdgeInsets.fromLTRB(20, 30, 20, 30);
}

// #region Colors
class AppColors {
  static const Color extraLightGrey =Color(0xFFF6F6F6);
  static const Color lightGrey =Color(0xFFEFEFEF);
  static const Color darkGrey =Color(0xFF848484);
  static const Color extraDarkGrey =Color(0xFF6D6D6D);
  static const Color purple =Color(0xFF3b006a);
  static const Color linkBlue =Color(0xFF0d99ff);
  static const Color white =Color(0xFfffffff);
  static const Color red =Color.fromARGB(227, 223, 1, 1);
  static const Color black =Color(0xFF000000);
}
// #endregion

// #region TextStyles
class AppTextStyles {
  static TextStyle semiBoldheaderStyle = const TextStyle(
      fontFamily: 'Raleway', fontSize: 21, fontWeight: FontWeight.w700);

  static TextStyle boldSubHeadingStyle = const TextStyle(
      fontFamily: 'Quicksand', fontSize: 17, fontWeight: FontWeight.w800);

  static TextStyle semiBoldSubHeadingStyle = const TextStyle(
      fontFamily: 'Quicksand', fontSize: 17, fontWeight: FontWeight.w700);

  static TextStyle mediumSubHeadingStyle = const TextStyle(
      fontFamily: 'Quicksand', fontSize: 17, fontWeight: FontWeight.w600);

  static TextStyle boldContentStyle = const TextStyle(
      fontFamily: 'Quicksand', fontSize: 13, fontWeight: FontWeight.w800);

  static TextStyle semiBoldContentStyle = const TextStyle(
      fontFamily: 'Quicksand', fontSize: 13, fontWeight: FontWeight.w700);

  static TextStyle mediumContentStyle = const TextStyle(
      fontFamily: 'Quicksand', fontSize: 13, fontWeight: FontWeight.w600);
}
// #endregion

// #region Shadows
class AppShaddows {
  static List<BoxShadow> customShadow = [
    BoxShadow(
        color: AppColors.purple.withOpacity(0.15),
        spreadRadius: 0,
        offset: const Offset(4, 4),
        blurRadius: 8,
        blurStyle: BlurStyle.normal),
    BoxShadow(
        color: AppColors.white.withOpacity(0.60),
        spreadRadius: 0,
        offset: const Offset(-4, -4),
        blurRadius: 4,
        blurStyle: BlurStyle.normal)
  ];
  static List<BoxShadow> addButtonShadow = [
    BoxShadow(
        color: AppColors.purple.withOpacity(0.20),
        spreadRadius: 0,
        offset: const Offset(-4, -4),
        blurRadius: 8,
        blurStyle: BlurStyle.inner),
    BoxShadow(
        color: AppColors.white.withOpacity(0.70),
        spreadRadius: 0,
        offset: const Offset(4, 4),
        blurRadius: 8,
        blurStyle: BlurStyle.inner)
  ];

  static List<BoxShadow> addIconShadow = [
    BoxShadow(
      color: AppColors.purple.withOpacity(0.40),
      spreadRadius: 0,
      offset: const Offset(1, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: AppColors.white.withOpacity(0.1),
      spreadRadius: 0,
      offset: const Offset(-1, -1),
      blurRadius: 2,
    )
  ];

  static List<BoxShadow> contactButtonShadow = [
    BoxShadow(
        color: AppColors.purple.withOpacity(0.15),
        spreadRadius: 0,
        offset: const Offset(4, 4),
        blurRadius: 12,
        blurStyle: BlurStyle.inner),
    BoxShadow(
        color: AppColors.white.withOpacity(0.50),
        spreadRadius: 0,
        offset: const Offset(-4, -4),
        blurRadius: 12,
        blurStyle: BlurStyle.inner)
  ];
}
// #endregion

