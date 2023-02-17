import 'package:cloud_contacts/utils/resources.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/routes.dart' as routes;

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
      onGenerateRoute: routes.Routes.controller,
      initialRoute: routes.Routes.login,
    );
  }
}