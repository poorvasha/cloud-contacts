import 'package:cloud_contacts/configs/resources.dart';
import 'package:cloud_contacts/modal_sheets/add_contact_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../configs/routes.dart';
import '../models/contact_model.dart';
import '../models/input_field_data.dart';
import '../providers/app_model.dart';
import '../services/secure_local_storage.dart';
import '../widgets/contact_block.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<InputFieldData> contactEntryInputFieldData = [];
  var isContactSaveButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    setInttialValueForInputFields();
  }

  void setInttialValueForInputFields() {
    contactEntryInputFieldData = [
      InputFieldData(
        iconData: Icons.sentiment_very_satisfied_rounded,
        hintText: 'Enter Your Buddy Name',
        errMessage: 'please enter valid name',
        myController: TextEditingController(),
        keyboardType: TextInputType.emailAddress,
        textInputType: FilteringTextInputFormatter.singleLineFormatter,
        onTextChange: () {},
      ),
      InputFieldData(
        iconData: Icons.call_rounded,
        hintText: 'Enter Your Buddy Phone Number',
        errMessage: 'please enter valid phone number',
        myController: TextEditingController(),
        keyboardType: TextInputType.text,
        textInputType: FilteringTextInputFormatter.singleLineFormatter,
        onTextChange: () {},
      )
    ];
  }

  void onAddBtnPressed(BuildContext context) {
    setInttialValueForInputFields();
    AppModals().contactEntryBottomSheet(
        context, contactEntryInputFieldData, true, false);
  }

  logoutbtnOnPressed() async {
    await SecureStorage().deleteSecureData('userToken');
    context.read<AppModel>().setInitialRoute = Routes.login;
  }

  onContactTapped(ContactModel selectedItem) {
    setInttialValueForInputFields();
    
      AppModals().contactEntryBottomSheet(context, contactEntryInputFieldData,
          false, false, editBtnOnPressed, deleteBtnOnPressed, selectedItem);
   
  }

  void editBtnOnPressed(ContactModel? selectedItem) {
    contactEntryInputFieldData =
        contactEntryInputFieldData.map<InputFieldData>((item) {
      item.isEnabled = true;
      item.disabledBGColor = AppColors.extraLightGrey;
      return item;
    }).toList();
    Navigator.of(context).pop();
    AppModals().contactEntryBottomSheet(context, contactEntryInputFieldData,
        false, true, editBtnOnPressed, deleteBtnOnPressed, selectedItem);
  }

  void deleteBtnOnPressed(ContactModel? selectedItem) {

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: logoutbtnOnPressed,
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Theme.of(context).backgroundColor,
                    size: 24,
                  ),
                ),
              ),
            ],
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Your Buddies",
              style: AppTextStyles.semiBoldheaderStyle
                  .copyWith(color: AppColors.lightGrey),
              textAlign: TextAlign.center,
            )),
        body: Padding(
          padding: AppResources.screenMargin.copyWith(top: 10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 135,
                child: ListView.builder(
                    itemCount: context.watch<AppModel>().getContacts.length,
                    itemBuilder: ((context, index) => GestureDetector(
                        onTap: () => 
                              onContactTapped(AppModel().getContacts[index]),
                            
                        child: ContactBlock(
                            contact: context
                                .watch<AppModel>()
                                .getContacts[index])))),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: AppShaddows.addButtonShadow),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () => onAddBtnPressed(context),
            child: Icon(Icons.add_rounded,
                shadows: AppShaddows.addIconShadow,
                size: 40,
                color: Theme.of(context).primaryColor),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
