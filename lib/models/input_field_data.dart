import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldData {
  String? labelName;
  String hintText;
  IconData? iconData;
  String errMessage;
  bool isValid;
  TextEditingController myController;
  TextInputType keyboardType;
  TextInputFormatter textInputType;

  InputFieldData(this.labelName, this.iconData, {required this.hintText, required this.errMessage, required this.isValid,
      required this.myController, required this.keyboardType, required this.textInputType});
}