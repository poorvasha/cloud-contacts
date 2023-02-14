import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/input_field_data.dart';

class AppResources {
  static var screenMargin = const EdgeInsets.fromLTRB(30, 30, 30, 60);
}

// #region Colors
class AppColors {
  static Color extraLightGrey = const Color(0xFFF6F6F6);
  static Color lightGrey = const Color(0xFFEFEFEF);
  static Color darkGrey = const Color(0xFF848484);
  static Color extraDarkGrey = const Color(0xFF6D6D6D);
  static Color purple = const Color(0xFF6C3082);
  static Color linkBlue = const Color(0xFF0d99ff);
  static Color white = const Color(0xFfffffff);
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
        spreadRadius: 8,
        offset: const Offset(-4, -4),
        blurRadius: 12,
        blurStyle: BlurStyle.normal)
  ];
}
// #endregion

// #region Input Datas
class AppInputDatas {
  static List<InputFieldData> loginInputData = [
    InputFieldData(null, Icons.person_rounded,
        hintText: 'username',
        errMessage: 'please enter valid username',
        isValid: true,
        myController: TextEditingController(),
        keyboardType: TextInputType.emailAddress,
        textInputType: FilteringTextInputFormatter.singleLineFormatter),
    InputFieldData(null, Icons.lock_rounded,
        hintText: 'password',
        errMessage: 'please enter valid password',
        isValid: true,
        myController: TextEditingController(),
        keyboardType: TextInputType.text,
        textInputType: FilteringTextInputFormatter.singleLineFormatter)
  ];

  static List<InputFieldData> signInputData = [
    InputFieldData(null, Icons.person_rounded,
        hintText: 'username',
        errMessage: 'please enter valid username',
        isValid: true,
        myController: TextEditingController(),
        keyboardType: TextInputType.emailAddress,
        textInputType: FilteringTextInputFormatter.singleLineFormatter),
    InputFieldData(null, Icons.lock_rounded,
        hintText: 'password',
        errMessage: 'please enter valid password',
        isValid: true,
        myController: TextEditingController(),
        keyboardType: TextInputType.text,
        textInputType: FilteringTextInputFormatter.singleLineFormatter),
    InputFieldData(null, Icons.lock_reset_rounded,
        hintText: 're-enter your password',
        errMessage: 'please enter valid password',
        isValid: true,
        myController: TextEditingController(),
        keyboardType: TextInputType.text,
        textInputType: FilteringTextInputFormatter.singleLineFormatter)
  ];
}
// #region
