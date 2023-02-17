import 'package:cloud_contacts/screens/startup_screens/login_screen.dart';
import 'package:cloud_contacts/utils/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/contacts.dart';
import 'screens/startup_screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud Contacts',
      theme: ThemeData(
        backgroundColor: AppColors.extraLightGrey,
        primaryColor: AppColors.purple,
      ),
      home: const ContactsScreen()
    );
  }
}