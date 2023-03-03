import 'package:cloud_contacts/models/contact_model.dart';
import 'package:flutter/material.dart';

import '../configs/routes.dart' as routes;

class AppModel with ChangeNotifier {
  String? _intialRoute = routes.Routes.intial;
  String? get getInitialRoute {
    return _intialRoute;
  }

  set setInitialRoute(String? route) {
    _intialRoute = route;
    notifyListeners();
  }

  List<ContactWithIdModel> _contacts = [];
  List<ContactWithIdModel> get getContacts {
    return _contacts;
  }

  set setContacts(List<ContactWithIdModel> contacts) {
    _contacts = contacts;
    notifyListeners();
  }
}
