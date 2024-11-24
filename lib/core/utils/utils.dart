import 'package:flutter/material.dart';
import 'package:townsquare/core/theme/colors.dart';

import '../../presentation/widgets/typography/ts_text.dart';

class Utils {
  Utils._();
  static Future<void> showSnackBar({
    required BuildContext context,
    required String content,
    Widget? iconButton,
    required Color bgColor,
    Color? textColor,
    double? bottomMargin,
  }) async {
    var msgr = ScaffoldMessenger.of(context);
    SnackBar snackBar = SnackBar(
      content: TsText(
        content,
        color: textColor ?? kBlack,
        weight: FontWeight.w500,
        size: 15,
      ),
      backgroundColor: bgColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.only(
        bottom: bottomMargin ?? 8,
        top: 8,
        right: 8,
        left: 8,
      ),
    );
    msgr.clearSnackBars();
    msgr.showSnackBar(snackBar);
  }

  static Future<void> showInprogressBar({required BuildContext context}) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog.adaptive(
            backgroundColor: kWhite,
            surfaceTintColor: kWhite,
            title: const TsText('In Progress'),
            content: const TsText('This button is currently in progress.'),
            actions: [
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(kPrimary600),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const TsText('Close'),
              ),
            ],
          );
        });
  }
}
