import 'package:cloud_contacts/configs/resources.dart';
import 'package:cloud_contacts/models/contact_model.dart';
import 'package:cloud_contacts/screens/contacts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/routes.dart';
import '../models/input_field_data.dart';
import '../providers/app_model.dart';
import '../utils/helpers.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AppModals {
  late BuildContext context;
  bool isContactSaveButtonEnabled = false;
  ContactModel? selectedItem;
  List<InputFieldData>? contactEntryInputFieldData;
  bool nameTextChange(String text) {
    if (text != "" && text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool phoneNumberTextChange(String text) {
    if (text != "" && text.isNotEmpty) {
      return Helpers.validatePhoneNumber(text);
    }
    return false;
  }

  saveBtnOnPressed() {
    //context.read<AppModel>().setInitialRoute = Routes.login;
    var name = contactEntryInputFieldData![0].myController.text;
    var phoneNumber = contactEntryInputFieldData![1].myController.text;
    Navigator.of(context).pop();
  }

  onValidateAllInputs(bool isAllInputsValid) {
    isContactSaveButtonEnabled = isAllInputsValid;
  }

  dynamic contactEntryBottomSheet(
      BuildContext context,
      List<InputFieldData> contactEntryInputFieldData,
      bool isAddContactTapped,
      bool isContactSaveButtonEnabled,
      [Function? editBtnOnPressed,
      Function? deleteBtnOnPressed,
      ContactModel? selectedItem]) {
    this.context = context;
    this.contactEntryInputFieldData = contactEntryInputFieldData;
    this.selectedItem = selectedItem;
    this.isContactSaveButtonEnabled = isContactSaveButtonEnabled;
    List<InputFieldData> addContactFieldsData =
        this.contactEntryInputFieldData!.map<InputFieldData>(
      (element) {
        element.onTextChange = element.hintText.contains('Name')
            ? nameTextChange
            : phoneNumberTextChange;

        if (!isAddContactTapped) {
          if (element.hintText.contains('Name')) {
            element.myController =
                TextEditingController(text: this.selectedItem?.name);
          } else {
            element.myController =
                TextEditingController(text: this.selectedItem?.phoneNumber);
          }

          element.disabledBGColor = isContactSaveButtonEnabled
              ? AppColors.extraLightGrey
              : AppColors.lightGrey;
        }

        return element;
      },
    ).toList();
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: this.context,
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
                child: SingleChildScrollView(
                  child: Flexible(
                      child: Padding(
                    padding: AppResources.screenMargin.copyWith(top: 0),
                    child: Column(
                      children: [
                        // #region SubHeader "WelCome Back"
                        Row(
                          mainAxisAlignment: isAddContactTapped
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text('Add Contact',
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.semiBoldheaderStyle
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor)),
                            ),
                            if (!isAddContactTapped) ...{
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      editBtnOnPressed!(this.selectedItem);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 24,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  IconButton(
                                    onPressed:
                                        deleteBtnOnPressed!(this.selectedItem),
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      size: 24,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              )
                            }
                          ],
                        ),
                        const SizedBox(height: 40),
                        // #endregion

                        // #region Input Fields
                        InputFields(
                            inputFields: addContactFieldsData,
                            onValidateAllInputs: onValidateAllInputs),
                        // #endregion
                        const SizedBox(height: 20),
                        // #region Login Button
                        CustomButton(
                            buttonText: "Save",
                            height: 70,
                            width: null,
                            onBtnPressed: saveBtnOnPressed,
                            enabled: this.isContactSaveButtonEnabled),
                        // #endregion
                      ],
                    ),
                  )),
                ),
              ),
            )));
  }
}
