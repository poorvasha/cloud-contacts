import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_model.dart';
import '../../utils/helpers.dart';
import '../../configs/routes.dart' as routes;

class InitalScreen extends StatefulWidget {
  const InitalScreen({super.key});

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  @override
  void initState() {
    super.initState();
    setIntialScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  void setIntialScreen() async {
    Helpers().checkIsUserLoggedIn().then((isUserLoggedIn) {
      context.read<AppModel>().setInitialRoute =
          isUserLoggedIn ? routes.Routes.contacts : routes.Routes.login;
    });
  }
}
