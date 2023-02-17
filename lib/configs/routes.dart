import 'package:cloud_contacts/screens/contacts/contacts.dart';
import 'package:cloud_contacts/screens/startup_screens/intial_screen.dart';
import 'package:cloud_contacts/screens/startup_screens/login/login_screen.dart';
import 'package:cloud_contacts/screens/startup_screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String contacts = 'contacts';
  static const String intial = 'intial';

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case contacts:
        return MaterialPageRoute(builder: (context) => const ContactsScreen());
      case intial:
        return MaterialPageRoute(builder: (context) => const InitalScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
