import 'package:cloud_contacts/screens/startup_screens/login_screen.dart';
import 'package:cloud_contacts/configs/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ContactBlock extends StatefulWidget {
  const ContactBlock({super.key});

  @override
  State<ContactBlock> createState() => _ContactBlockState();
}

class _ContactBlockState extends State<ContactBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColors.darkGrey.withOpacity(0.2),
          width: 1,
        )),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Poorvasha"),
          FloatingActionButton(
              mini: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: AppShaddows.contactButtonShadow),
                child: SpeedDial(
                  iconTheme: IconThemeData(
                      size: 24, shadows: AppShaddows.addIconShadow),
                  spaceBetweenChildren: 20,
                  direction: SpeedDialDirection.left,
                  overlayOpacity: 0,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  buttonSize: const Size(35, 35),
                  gradientBoxShape: BoxShape.circle,
                  childrenButtonSize: const Size(0, 0),
                  overlayColor: Colors.transparent,
                  foregroundColor: Theme.of(context).primaryColor,
                  activeForegroundColor: Theme.of(context).backgroundColor,
                  activeBackgroundColor: Theme.of(context).primaryColor,
                  icon: Icons.arrow_back_ios_new_rounded,
                  children: [
                    SpeedDialChild(
                      elevation: 0,
                      onTap: () {},
                      labelShadow: AppShaddows.contactButtonShadow,
                      labelWidget: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: AppShaddows.contactButtonShadow),
                          child: Icon(Icons.phone_rounded, color: Theme.of(context).primaryColor)),
                    ),
                    SpeedDialChild(
                        elevation: 0,
                        foregroundColor: Colors.green,
                        onTap: () {},
                        labelShadow: AppShaddows.contactButtonShadow,
                        labelWidget: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: AppShaddows.contactButtonShadow),
                            child: Icon(
                              Icons.whatsapp_rounded,
                              color: Theme.of(context).primaryColor,
                            )))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
