import 'package:cloud_contacts/screens/contacts.dart';
import 'package:cloud_contacts/screens/startup_screens/intial_screen.dart';
import 'package:cloud_contacts/screens/startup_screens/login_screen.dart';
import 'package:cloud_contacts/configs/resources.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'utils/app_model.dart';
import 'configs/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppModel()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: displayHome(),
    );
  }

  Widget displayHome() {
    var currentroute = context.watch<AppModel>().getInitialRoute;
    switch (currentroute) {
      case 'intial':
        return const InitalScreen();
      case 'login':
        return const LoginScreen();
      case 'contacts':
        return const ContactsScreen();

      default:
        return const LoginScreen();
    }
  }
}
