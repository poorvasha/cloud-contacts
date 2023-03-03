import 'package:cloud_contacts/controller/auth_controller.dart';
import 'package:cloud_contacts/modal_sheets/add_contact_modal.dart';
import 'package:cloud_contacts/configs/resources.dart';
import 'package:cloud_contacts/models/user_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../configs/routes.dart';
import '../../models/input_field_data.dart';
import '../../providers/app_model.dart';
import '../../utils/dialog_helper.dart';
import '../../utils/helpers.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var isButtonEnabled = false;
  var passwordController = TextEditingController();
  List<InputFieldData> signInputData = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      signInputData = [
        InputFieldData(
          iconData: Icons.person_rounded,
          hintText: 'username',
          errMessage: 'please enter valid email',
          myController: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
          textInputType: FilteringTextInputFormatter.singleLineFormatter,
          onTextChange: onEmailTextChange,
        ),
        InputFieldData(
            iconData: Icons.lock_rounded,
            hintText: 'password',
            errMessage: 'password must be atleast 7 charaters',
            myController: passwordController,
            keyboardType: TextInputType.text,
            textInputType: FilteringTextInputFormatter.singleLineFormatter,
            onTextChange: onPasswordTextChange,
            obscureText: true),
        InputFieldData(
            iconData: Icons.lock_reset_rounded,
            hintText: 're-enter your password',
            errMessage:
                'password mismatch or password must be atleast 7 charaters',
            myController: TextEditingController(),
            keyboardType: TextInputType.text,
            textInputType: FilteringTextInputFormatter.singleLineFormatter,
            onTextChange: onReEnterPasswordTextChange,
            obscureText: true,
            equalDependencyController: passwordController),
      ];
    });
  }

  static bool onEmailTextChange(String text) {
    if (text != "" && text.isNotEmpty) {
      return Helpers.validateEmail(text);
    }
    return false;
  }

  static bool onPasswordTextChange(String text) {
    if (text != "" && text.isNotEmpty) {
      return Helpers.validatePassword(text);
    }
    return false;
  }

  static bool onReEnterPasswordTextChange(String text) {
    if (text != "" && text.isNotEmpty) {
      return Helpers.validatePassword(text);
    }
    return false;
  }

  signUpBtnOnPressed() async {
    var userModel = UserModel(
        email: signInputData[0].myController.text,
        password: signInputData[1].myController.text);
    // var userModel = UserModel(
    //     name: "selvi", email: "selvi@gmail.co", password: "selvi@20");
    var result = await AuthController().registerUser(context, userModel);
    if (result.isEmpty) return;
    await DialogHelper().showErrorDialog(context,
        title: "Congratulation!", description: "Registration Sucessfull");
    context.read<AppModel>().setInitialRoute = Routes.login;
  }

  onValidateAllInputs(bool isAllInputsValid) {
    setState(() {
      isButtonEnabled = isAllInputsValid;
    });
  }

  void onTapLogin() {
    context.read<AppModel>().setInitialRoute = Routes.login;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScope.of(context).unfocus();
      }),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            // #region Body
            Positioned(
              height: MediaQuery.of(context).size.height - 225,
              top: 225,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppResources.screenMargin.copyWith(top: 98),
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
                      InputFields(
                          inputFields: signInputData,
                          onValidateAllInputs: onValidateAllInputs),
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = onTapLogin,
                              text: " Login",
                              style: AppTextStyles.boldContentStyle.copyWith(
                                  color: Theme.of(context).primaryColor)),
                        ]),
                      ),
                      const SizedBox(height: 40),
                      // #endregion

                      // #region Login Button
                      CustomButton(
                          buttonText: "Sign Up",
                          height: 70,
                          width: null,
                          onBtnPressed: signUpBtnOnPressed,
                          enabled: isButtonEnabled),
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
      ),
    );
  }
}
