import 'package:cloud_contacts/configs/resources.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  // Show Dialog
  showErrorDialog(BuildContext context,
      {String? title = 'Attention!',
      String? description = 'Something went wrong'}) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                title ?? '',
                style: AppTextStyles.boldSubHeadingStyle
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              content: Text(
                description ?? '',
                style: AppTextStyles.mediumContentStyle
                    .copyWith(color: AppColors.extraDarkGrey),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Okay',
                    style: AppTextStyles.boldSubHeadingStyle
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  // Show toast
  // Show snack bar
  // Show loading
  Future<void> showLoading(BuildContext context, {String? message}) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => SimpleDialog(children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 8,
                    ),
                    Text(
                      message ?? 'loading...',
                      style: AppTextStyles.mediumContentStyle
                          .copyWith(color: AppColors.extraDarkGrey),
                    )
                  ],
                ),
              ),
            ]));
  }

  // Hide loading
  void hideLoading(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
