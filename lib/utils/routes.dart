import 'package:cloud_contacts/screens/contacts.dart';
import 'package:cloud_contacts/screens/startup_screens/login_screen.dart';
import 'package:cloud_contacts/screens/startup_screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String contacts = 'contacts';

  static Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case signUp:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case contacts:
      return MaterialPageRoute(builder: (context) => const ContactsScreen());
    default:
      throw('This route name does not exit');
  }
}
}