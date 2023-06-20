import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_contacts/models/contact_model.dart';
import 'package:http/http.dart' as http;

import '../configs/api_routes.dart';
import '../utils/client_helper.dart';
import 'package:cloud_contacts/utils/app_exception.dart';

class ContactsService {
  Future<dynamic> registerContact(dynamic payload) async {
    var client = http.Client();
    var uri = Uri.parse(ApiRoutes.contacts_add_APIURL);
    try {
      var response = await client.post(uri,
          body: payload,
          headers:
              await ClientHelper.getClientHeader(authenticationRequired: true));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }

  Future<dynamic> fetchAllContacts() async {
    var client = http.Client();
    var uri = Uri.parse(ApiRoutes.contacts_fetch_all_APIURL);
    try {
      var response = await client.get(uri,
          headers:
              await ClientHelper.getClientHeader(authenticationRequired: true));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }

  Future<dynamic> updateContact(dynamic payload, String contactId) async {
    var client = http.Client();
    var uri = Uri.parse(
        ApiRoutes.contacts_update_APIURL.replaceAll(":contactId", contactId));
    try {
      var response = await client.patch(uri,
          body: payload,
          headers:
              await ClientHelper.getClientHeader(authenticationRequired: true));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }

  Future<dynamic> deleteContact(String contactId) async {
    var client = http.Client();
    var uri = Uri.parse(
        ApiRoutes.contacts_delete_APIURL.replaceAll(":contactId", contactId));
    try {
      var response = await client.delete(uri,
          headers:
              await ClientHelper.getClientHeader(authenticationRequired: true));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }

  Future<dynamic> deleteAllContacts() async {
    var client = http.Client();
    var uri = Uri.parse(ApiRoutes.contacts_delete_all_APIURL);
    try {
      var response = await client.delete(uri,
          headers:
              await ClientHelper.getClientHeader(authenticationRequired: true));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }

  Future<dynamic> fetchContact() async {
    var client = http.Client();
    var uri = Uri.parse(ApiRoutes.contacts_fetch_specific_APIURL);
    try {
      var response = await client.get(uri,
          headers:
              await ClientHelper.getClientHeader(authenticationRequired: true));
      return ClientHelper.processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in Time', uri.toString());
    }
  }
}
