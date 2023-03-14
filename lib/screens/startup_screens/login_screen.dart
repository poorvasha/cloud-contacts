import 'package:cloud_contacts/configs/resources.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../../models/input_field_data.dart';
import '../../models/local_storage_item.dart';
import '../../models/user_model.dart';
import '../../providers/app_model.dart';
import '../../configs/routes.dart';
import '../../services/secure_local_storage.dart';
import '../../utils/dialog_helper.dart';
import '../../utils/helpers.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isButtonEnabled = false;
  List<InputFieldData> loginInputData = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      loginInputData = [
        InputFieldData(
          iconData: Icons.person_rounded,
          hintText: 'email',
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
            myController: TextEditingController(),
            keyboardType: TextInputType.text,
            textInputType: FilteringTextInputFormatter.singleLineFormatter,
            onTextChange: onPasswordTextChange,
            obscureText: true)
      ];
    });
  }

  bool onEmailTextChange(String text) {
    if (text != "" && text.isNotEmpty) {
      return Helpers.validateEmail(text);
    }
    return false;
  }

  bool onPasswordTextChange(String text) {
    if (text != "" && text.isNotEmpty) {
      return Helpers.validatePassword(text);
    }
    return false;
  }

  loginBtnOnPressed() async {
    var userModel = UserModel(
        email: loginInputData[0].myController.text,
        password: loginInputData[1].myController.text);
    // var userModel = UserModel(email: "selvi@gmail.co", password: "selvi@20");
    var result = await AuthController().loginUser(context, userModel);
    if (result.isEmpty) return;
    await SecureStorage().writeSecureData(
        LocalStorageItem(key: "accesstoken", value: result["accesstoken"]));
    Provider.of<AppModel>(context, listen: false).setInitialRoute =
        Routes.contacts;
  }

  onValidateAllInputs(bool isAllInputsValid) {
    setState(() {
      isButtonEnabled = isAllInputsValid;
    });
  }

  void onTapSignUp() {
    context.read<AppModel>().setInitialRoute = Routes.signUp;
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
                      const SizedBox(height: 60),
                      // #endregion

                      // #region Input Fields
                      InputFields(
                          inputFields: loginInputData,
                          onValidateAllInputs: onValidateAllInputs),
                      // #endregion

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
                              recognizer: TapGestureRecognizer()
                                ..onTap = onTapSignUp,
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
                          onBtnPressed: loginBtnOnPressed,
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
}
