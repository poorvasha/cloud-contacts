import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/input_field_data.dart';

class AppResources {
  static var screenMargin = const EdgeInsets.fromLTRB(20, 30, 20, 30);
}

// #region Colors
class AppColors {
  static Color extraLightGrey = const Color(0xFFF6F6F6);
  static Color lightGrey = const Color(0xFFEFEFEF);
  static Color darkGrey = const Color(0xFF848484);
  static Color extraDarkGrey = const Color(0xFF6D6D6D);
  static Color purple = const Color(0xFF3b006a);
  static Color linkBlue = const Color(0xFF0d99ff);
  static Color white = const Color(0xFfffffff);
  static Color red = Color.fromARGB(227, 223, 1, 1);
  static Color black = const Color(0xFF000000);
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

// #region Input Datas
class AppInputDatas {
  static List<InputFieldData> contactEntryInputFieldData = [
    InputFieldData(
      iconData: Icons.sentiment_very_satisfied_rounded,
      hintText: 'Enter Your Buddy Name',
      errMessage: 'please enter valid name',
      myController: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      textInputType: FilteringTextInputFormatter.singleLineFormatter,
      onTextChange: () {},
    ),
    InputFieldData(
      iconData: Icons.call_rounded,
      hintText: 'Enter Your Buddy Phone Number',
      errMessage: 'please enter valid password',
      myController: TextEditingController(),
      keyboardType: TextInputType.text,
      textInputType: FilteringTextInputFormatter.singleLineFormatter,
      onTextChange: () {},
    )
  ];
}
// #endregion
