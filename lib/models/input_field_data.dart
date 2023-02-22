import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/resources.dart';



class InputFieldData {
  String? labelName;
  IconData? iconData;
  String hintText;
  String errMessage;
  bool isValid;
  TextEditingController myController;
  TextInputType keyboardType;
  TextInputFormatter textInputType;
  Function onTextChange;
  bool obscureText;
  bool showErrMessage;
  TextEditingController? equalDependencyController;
  bool? isEnabled;
  Color? disabledBGColor;

  InputFieldData(
      {this.labelName,
      this.iconData,
      required this.hintText,
      required this.errMessage,
      this.isValid = true,
      required this.myController,
      required this.keyboardType,
      required this.textInputType,
      required this.onTextChange,
      this.obscureText = false,
      this.showErrMessage = false,
      this.equalDependencyController,
      this.isEnabled = true,
      this.disabledBGColor = AppColors.extraLightGrey});
}
