import 'dart:convert';
import 'package:cloud_contacts/models/contact_model.dart';
import 'package:cloud_contacts/services/auth_service.dart';
import 'package:flutter/widgets.dart';

import '../services/contacts_service.dart';
import '../utils/client_helper.dart';
import '../utils/dialog_helper.dart';

class ContactsController {
  Future<List<ContactWithIdModel>> registerContact(
      BuildContext context, ContactModel payload) async {
    DialogHelper().showLoading(context, message: "Hold a sec");
    var contactstoJson = json.encode(payload.toJson());
    var response = await ContactsService()
        .registerContact(contactstoJson)
        .catchError(
            (error)  => ClientHelper().handleResponseError(context, error));
    if (response == null) return [];
    List<dynamic> jsonDecoded = json.decode(response);
    var contactsFromJson =
        jsonDecoded.map((e) => ContactWithIdModel.fromJson(e)).toList();
    DialogHelper().hideLoading(context);
    return contactsFromJson;
  }

  Future<List<ContactWithIdModel>> fetchAllContacts(
      BuildContext context) async {
    DialogHelper().showLoading(context, message: "Hold a sec");
    var response = await ContactsService().fetchAllContacts().catchError(
        (error) => ClientHelper().handleResponseError(context, error));
    if (response == null) return [];
    List<dynamic> jsonDecoded = json.decode(response);
    var contactsFromJson =
        jsonDecoded.map((e) => ContactWithIdModel.fromJson(e)).toList();
    DialogHelper().hideLoading(context);
    return contactsFromJson;
  }

  Future<List<ContactWithIdModel>> updateContact(
      BuildContext context, ContactWithIdModel payload) async {
    DialogHelper().showLoading(context, message: "Hold a sec");
    var contactstoJson = json.encode(payload.toJson());
    var response = await ContactsService()
        .updateContact(contactstoJson, payload.id.toString())
        .catchError(
            (error) => ClientHelper().handleResponseError(context, error));
    if (response == null) return [];
    List<dynamic> jsonDecoded = json.decode(response);
    var contactsFromJson =
        jsonDecoded.map((e) => ContactWithIdModel.fromJson(e)).toList();
    DialogHelper().hideLoading(context);
    return contactsFromJson;
  }

  Future<List<ContactWithIdModel>> deleteContact(
      BuildContext context, ContactWithIdModel payload) async {
    DialogHelper().showLoading(context, message: "Hold a sec");
    var contactstoJson = json.encode(payload.toJson());
    var response = await ContactsService()
        .deleteContact(payload.id.toString())
        .catchError(
            (error) => ClientHelper().handleResponseError(context, error));
    if (response == null) return [];
    List<dynamic> jsonDecoded = json.decode(response);
    var contactsFromJson =
        jsonDecoded.map((e) => ContactWithIdModel.fromJson(e)).toList();
    DialogHelper().hideLoading(context);
    return contactsFromJson;
  }

  // Future<Map<String, dynamic>> deleteAllContacts() async {}

  // Future<Map<String, dynamic>> fetchContact() async {}
}
