import 'package:flutter/material.dart';

import '../models/input_field_data.dart';
import '../configs/resources.dart';

class InputFields extends StatefulWidget {
  InputFields({super.key, required this.inputFields});

  List<InputFieldData> inputFields;

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: widget.inputFields.length,
        itemBuilder: ((context, index) => SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // #region LableName
                  if (widget.inputFields[index].labelName != null) ...{
                    Text(widget.inputFields[index].labelName.toString(),
                        style: AppTextStyles.semiBoldSubHeadingStyle
                            .copyWith(color: AppColors.extraDarkGrey)),
                  },
                  // #endregion

                  // #region InputField
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.extraLightGrey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35)),
                        boxShadow: AppShaddows.customShadow),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.inputFields[index].iconData != null) ...{
                          Icon(widget.inputFields[index].iconData,
                              size: 24, color: Theme.of(context).primaryColor),
                        },
                        Expanded(
                          child: TextField(
                            keyboardType:
                                widget.inputFields[index].keyboardType,
                            inputFormatters: [
                              widget.inputFields[index].textInputType
                            ],
                            controller: widget.inputFields[index].myController,
                            decoration: InputDecoration(
                                labelStyle: AppTextStyles.mediumSubHeadingStyle
                                    .copyWith(color: AppColors.darkGrey),
                                contentPadding: const EdgeInsets.all(20),
                                border: InputBorder.none,
                                hintText: widget.inputFields[index].hintText,
                                hintStyle: AppTextStyles.mediumContentStyle
                                    .copyWith(color: AppColors.darkGrey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // #endregion

                  // #region Error Message
                  if (!widget.inputFields[index].isValid) ...{
                    Text(widget.inputFields[index].errMessage,
                        style: AppTextStyles.semiBoldSubHeadingStyle
                            .copyWith(color: AppColors.extraDarkGrey)),
                  }
                  // #endregion
                ],
              ),
            )));
  }
}
