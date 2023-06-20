import 'package:flutter/material.dart';

import '../configs/resources.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      required this.buttonText,
      required this.height,
      required this.width,
      required this.onBtnPressed,
      required this.enabled});

  String? buttonText;
  double? height;
  double? width;
  Function onBtnPressed;
  bool enabled;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 70,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
          color: widget.enabled
              ? Theme.of(context).primaryColor
              : AppColors.darkGrey,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          boxShadow: AppShaddows.customShadow),
      child: TextButton(
        onPressed: (() {
          widget.enabled ? widget.onBtnPressed() : null;
        }),
        child: Text(widget.buttonText ?? "Text",
            style: AppTextStyles.boldSubHeadingStyle
                .copyWith(color: AppColors.extraLightGrey)),
      ),
    );
  }
}
