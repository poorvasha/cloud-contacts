import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_contacts/configs/api_routes.dart';
import 'package:cloud_contacts/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../utils/client_helper.dart';
import 'package:cloud_contacts/utils/app_exception.dart';

class AuthService {
  Future<dynamic> registerUser(dynamic payload) async {
    var client = http.Client();
    var uri = Uri.parse(ApiRoutes.auth_register_APIURL);
    try {
      var response = await client.post(uri,
          body: payload,
          headers: await ClientHelper.getClientHeader(
              authenticationRequired: false));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }

  Future<dynamic> loginUser(dynamic payload) async {
    var client = http.Client();
    var uri = Uri.parse(ApiRoutes.auth_login_APIURL);

    try {
      var response = await client.post(uri,
          body: payload,
          headers: await ClientHelper.getClientHeader(
              authenticationRequired: false));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }
}
