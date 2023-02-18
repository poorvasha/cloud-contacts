import 'package:flutter/material.dart';

import '../models/input_field_data.dart';
import '../configs/resources.dart';

class InputFields extends StatefulWidget {
  InputFields(
      {super.key,
      required this.inputFields,
      required this.onValidateAllInputs});

  List<InputFieldData> inputFields;
  Function onValidateAllInputs;

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  void onTextChange(String textValue, InputFieldData inputObj) {
    setState(() {
      inputObj.isValid = inputObj.onTextChange(textValue);
      inputObj.showErrMessage = !inputObj.onTextChange(textValue);
      var isAllInputsValid =
          widget.inputFields.every((element) => element.isValid == true);

      widget.onValidateAllInputs(isAllInputsValid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: widget.inputFields.length,
        itemBuilder: ((context, index) => SizedBox(
              height: 112,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                            enableInteractiveSelection: true,
                            obscureText: widget.inputFields[index].obscureText,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) =>
                                onTextChange(value, widget.inputFields[index]),
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

                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                          widget.inputFields[index].showErrMessage
                              ? widget.inputFields[index].errMessage
                              : "",
                          textAlign: TextAlign.right,
                          style: AppTextStyles.mediumContentStyle
                              .copyWith(color: AppColors.extraDarkGrey)),
                    ),
                  ),
                  if (widget.inputFields.length - 1 != index)
                    const SizedBox(
                      height: 15,
                    ),
                  // #endregion
                ],
              ),
            )));
  }
}
