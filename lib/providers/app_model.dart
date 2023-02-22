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

  List<ContactModel> _contacts = [
    ContactModel(1, 'jcndc', '8838199417'),
    ContactModel(2, 'pporvba', '8838199417'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),
    ContactModel(3, 'yuva', '9944937052'),

  ];
  List<ContactModel> get getContacts {
    return _contacts;
  }

  set setContacts(List<ContactModel> contacts) {
    _contacts = contacts;
    notifyListeners();
  }
}
