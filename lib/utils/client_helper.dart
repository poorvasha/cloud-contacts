import 'dart:convert';

import 'package:cloud_contacts/utils/app_exception.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../configs/api_routes.dart';
import '../services/secure_local_storage.dart';
import 'dialog_helper.dart';

class ClientHelper {
  static Future<Map<String, String>> getClientHeader(
      {bool authenticationRequired = true}) async {
    try {
      var header = {"content-type": "application/json"};
      if (authenticationRequired) {
        var authToken = await SecureStorage().readSecureData('accesstoken');
        header["auth_token"] = authToken.toString();
      }
      return header;
    } on Exception catch (e) {
      return {};
    }
  }

  static dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 401:
        throw FetchDataException(
            'Error occured with a statuscode : ${response.statusCode}',
            response.request?.url.toString());
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 404:
        throw ApiNotFoundException(
            'API Not Found', response.request?.url.toString());
      case 500:
        throw FetchDataException(
            'Error occured with a statuscode : ${response.statusCode}',
            response.request?.url.toString());
      default:
        throw FetchDataException(
            'Error occured with a statuscode : ${response.statusCode}',
            response.request?.url.toString());
    }
  }

  dynamic handleResponseError(BuildContext context, error) {
    DialogHelper().hideLoading(context);
    if (error is BadRequestException) {
      var resMessage = json.decode(error.message.toString());
      DialogHelper()
          .showErrorDialog(context, description: resMessage["message"]);
    } else if (error is ApiNotRespondingException) {
      var resMessage = json.decode(error.message.toString());
      DialogHelper()
          .showErrorDialog(context, description: resMessage["message"]);
    } else if (error is FetchDataException) {
      var resMessage = json.decode(error.message.toString());
      DialogHelper()
          .showErrorDialog(context, description: resMessage["message"]);
    } else if (error is UnAuthorizedException) {
      var resMessage = json.decode(error.message.toString());
      DialogHelper()
          .showErrorDialog(context, description: resMessage["message"]);
    } else if (error is ApiNotFoundException) {
      var resMessage = json.decode(error.message.toString());
      DialogHelper()
          .showErrorDialog(context, description: resMessage["message"]);
    }
  }
}
