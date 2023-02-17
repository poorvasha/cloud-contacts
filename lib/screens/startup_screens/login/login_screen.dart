import 'package:cloud_contacts/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_model.dart';
import '../../../configs/routes.dart' as routes;
import '../../../widgets/button.dart';
import '../../../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
         FocusScope.of(context).unfocus();
      }),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            // #region Body
            Positioned(
              height: MediaQuery.of(context).size.height - 225,
              width: MediaQuery.of(context).size.width,
              left: 0,
              top: 225,
              child: Padding(
                padding: AppResources.screenMargin.copyWith(top: 98),
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
    
                      const SizedBox(height: 60),
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
                              style: AppTextStyles.boldContentStyle.copyWith(
                                  color: Theme.of(context).primaryColor)),
                        ]),
                      ),
                      const SizedBox(height: 40),
                      // #endregion
    
                      // #region Login Button
                      CustomButton(
                        buttonText: "Login",
                        height: 70,
                        width: null,
                        onPressed: loginBtnOnPressed,
                      ),
                      // #endregion
                    ],
                  ),
                ),
              ),
            ),
            // #endregion
    
            // #region Header Image
            Positioned(
              height: 300,
              width: MediaQuery.of(context).size.width,
              top: 0,
              left: 0,
              child: Image.asset('assets/images/welcome_header_image.png',
                  width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
            ),
            // #endregion
          ],
        ),
      ),
    );
  }

  loginBtnOnPressed() {
    context.read<AppModel>().setInitialRoute = routes.Routes.contacts;
  }
}
