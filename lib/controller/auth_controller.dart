import 'dart:convert';
import 'package:cloud_contacts/models/user_model.dart';
import 'package:cloud_contacts/services/auth_service.dart';
import 'package:flutter/widgets.dart';

import '../utils/client_helper.dart';
import '../utils/dialog_helper.dart';

class AuthController {
  Future<Map<String, dynamic>> registerUser(
      BuildContext context, UserModel payload) async {
    DialogHelper().showLoading(context, message: "Hold a sec");
    var usertoJson = json.encode(payload.toJson());
    var response = await AuthService().registerUser(usertoJson).catchError(
        (error) => ClientHelper().handleResponseError(context, error));
    if (response == null) return {};
    var userFromJson = json.decode(response);
    DialogHelper().hideLoading(context);
    return userFromJson;
  }

  Future<Map<String, dynamic>> loginUser(
      BuildContext context, UserModel payload) async {
    DialogHelper().showLoading(context, message: "Hold a sec");
    var usertoJson = json.encode(payload.toJson());
    var response = await AuthService().loginUser(usertoJson).catchError(
        (error) => ClientHelper().handleResponseError(context, error));
    if (response == null) return {};
    var userFromJson = json.decode(response);
    DialogHelper().hideLoading(context);
    return userFromJson;
  }
}
