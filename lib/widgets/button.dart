import 'package:flutter/material.dart';

import '../utils/resources.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      required this.buttonText,
      required this.height,
      required this.width});

  String? buttonText;
  double? height;
  double? width;

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
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          boxShadow: AppShaddows.customShadow),
      child: TextButton(
        onPressed: () {},
        child: Text(widget.buttonText ?? "Text",
            style: AppTextStyles.boldSubHeadingStyle
                .copyWith(color: AppColors.extraLightGrey)),
      ),
    );
  }
}
