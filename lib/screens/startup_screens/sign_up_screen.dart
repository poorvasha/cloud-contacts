import 'package:cloud_contacts/utils/resources.dart';
import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          

        // #region Body
        Positioned(
          height: MediaQuery.of(context).size.height-263,
          top: 263,
          left: 0,
          right: 0,
          child: SingleChildScrollView(
            child: Padding(
              padding: AppResources.screenMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // #region SubHeader "WelCome Back"
                  Text('We are happy to serve you!',
                      style: AppTextStyles.semiBoldheaderStyle
                          .copyWith(color: Theme.of(context).primaryColor)),
                  const SizedBox(height: 20),
                  // #endregion
              
                  // #region Input Fields
                  InputFields(inputFields: AppInputDatas.signInputData),
                  // #endregion
              
                  // #region content "forgot password"
                  const SizedBox(height: 40),
                  // #endregion
              
                  // #region content "sign up"
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Already you have an account?",
                          style: AppTextStyles.mediumContentStyle
                              .copyWith(color: AppColors.extraDarkGrey)),
                      TextSpan(
                          text: " Login",
                          style: AppTextStyles.boldContentStyle
                              .copyWith(color: Theme.of(context).primaryColor)),
                    ]),
                  ),
                  const SizedBox(height: 40),
                  // #endregion
              
                  // #region Login Button
                  CustomButton(buttonText: "Sign Up", height: 70, width: null),
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
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/welcome_header_image.png',
                width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
          ),
          // #endregion
        
        ],
      ),
    );
  }
}
