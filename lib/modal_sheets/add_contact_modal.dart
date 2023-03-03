import 'package:cloud_contacts/configs/resources.dart';
import 'package:cloud_contacts/controller/contacts_controller.dart';
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
  bool isAddContactTapped = false;
  bool isContactSaveButtonEnabled = false;
  bool? isEditButtonTapped = false;
  late ContactWithIdModel? selectedItem;
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

  saveBtnOnPressed() async {
    var response;
    if (!isEditButtonTapped!) {
      var contactObj = ContactModel(
          name: contactEntryInputFieldData![0].myController.text,
          phoneNumber: contactEntryInputFieldData![1].myController.text);
      response =
          await ContactsController().registerContact(context, contactObj);
    } else {
      var contactObj = ContactWithIdModel(
          id: selectedItem!.id,
          userId: selectedItem!.userId,
          name: contactEntryInputFieldData![0].myController.text,
          phoneNumber: contactEntryInputFieldData![1].myController.text,
          date: "");

      response = await ContactsController().updateContact(context, contactObj);
    }

    if (response.isEmpty){
     
      return;
    } 
    Navigator.of(context).pop();
    context.read<AppModel>().setContacts = response;
    print(response);
  }

  deleteBtnOnPressed(ContactWithIdModel? selectedItem) async {
    var contactObj = ContactWithIdModel(
        id: selectedItem!.id,
        userId: selectedItem.userId,
        name: contactEntryInputFieldData![0].myController.text,
        phoneNumber: contactEntryInputFieldData![1].myController.text,
        date: "");
    var response =
        await ContactsController().deleteContact(context, contactObj);

    Navigator.of(context).pop();
    if (response.isEmpty) return;

    context.read<AppModel>().setContacts = response;
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
      ContactWithIdModel? selectedItem,
      bool? isEditButtonTapped = false]) {
    this.context = context;
    this.isEditButtonTapped = isEditButtonTapped;
    this.contactEntryInputFieldData = contactEntryInputFieldData;
    this.isAddContactTapped = isAddContactTapped;
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
                                    onPressed: () =>
                                        deleteBtnOnPressed(this.selectedItem),
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
