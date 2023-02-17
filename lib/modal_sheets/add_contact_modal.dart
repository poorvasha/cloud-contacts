import 'package:cloud_contacts/configs/resources.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AppModals {
  static dynamic contactEntryBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) => GestureDetector(
              onTap: (() {
                FocusScope.of(context).unfocus();
              }),
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Flexible(
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: AppResources.screenMargin.copyWith(top: 0),
                    child: Column(
                      children: [
                        // #region SubHeader "WelCome Back"
                        Text('Add Contact',
                            style: AppTextStyles.semiBoldheaderStyle.copyWith(
                                color: Theme.of(context).primaryColor)),
                        const SizedBox(height: 20),
                        // #endregion

                        // #region Input Fields
                        InputFields(
                            inputFields:
                                AppInputDatas.contactEntryInputFieldData),
                        // #endregion
                        const SizedBox(height: 60),
                        // #region Login Button
                        CustomButton(
                            buttonText: "Save",
                            height: 70,
                            width: null,
                            onPressed: () {}),
                        // #endregion
                      ],
                    ),
                  )),
                ),
              ),
            )));
  }
}
