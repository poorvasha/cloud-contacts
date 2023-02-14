import 'package:cloud_contacts/utils/resources.dart';
import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          // #region Header Image
          Image.asset('assets/images/welcome_header_image.png',
              width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
          // #endregion

          // #region Body
          Padding(
            padding: AppResources.screenMargin,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // #region SubHeader "WelCome Back"
                  Text('Welcome Back!',
                      style: AppTextStyles.semiBoldheaderStyle
                          .copyWith(color: Theme.of(context).primaryColor)),
                  const SizedBox(height: 20),
                  // #endregion

                  // #region Input Fields
                  InputFields(inputFields: AppInputDatas.loginInputData),
                  // #endregion

                  // #region content "forgot password"
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('forgot password',
                          style: AppTextStyles.mediumContentStyle
                              .copyWith(color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // #endregion

                  // #region content "sign up"
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don\'t have an account?",
                          style: AppTextStyles.mediumContentStyle
                              .copyWith(color: AppColors.extraDarkGrey)),
                      TextSpan(
                          text: " Sign Up",
                          style: AppTextStyles.boldContentStyle
                              .copyWith(color: Theme.of(context).primaryColor)),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  // #endregion

                  // #region Login Button
                  CustomButton(buttonText: "Login", height: 70, width: null),
                  // #endregion
                ],
              ),
            ),
          ),
          // #endregion
        ],
      ),
    );
  }
}
