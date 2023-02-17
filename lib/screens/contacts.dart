import 'package:cloud_contacts/utils/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../widgets/contact_block.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.logout_rounded,
                  color: Theme.of(context).backgroundColor,
                  size: 24,
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
                    itemCount: 15,
                    itemBuilder: ((context, index) => const ContactBlock())),
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
            onPressed: () {},
            child: Icon(Icons.add_rounded,
                shadows: AppShaddows.addIconShadow,
                size: 40,
                color: Theme.of(context).primaryColor),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
