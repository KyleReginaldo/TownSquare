// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/theme/colors.dart';
import '../typography/ts_text.dart';

class TsElevatedButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final double? desktopTextSize;
  final double? mobileTabletTextSize;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  const TsElevatedButton(
    this.text, {
    super.key,
    this.icon,
    this.desktopTextSize,
    this.mobileTabletTextSize,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });
  factory TsElevatedButton.icon({
    required String text,
    Widget? icon,
    double? desktopTextSize,
    double? mobileTabletTextSize,
    VoidCallback? onTap,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return TsElevatedButton(
      text,
      icon: icon,
      desktopTextSize: desktopTextSize,
      mobileTabletTextSize: mobileTabletTextSize,
      onTap: onTap,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(
          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
              ? const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 1,
                )
              : const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
        ),
        backgroundColor: backgroundColor != null
            ? MaterialStatePropertyAll(backgroundColor)
            : const MaterialStatePropertyAll(
                kBlack,
              ),
        foregroundColor: textColor != null
            ? MaterialStatePropertyAll(textColor)
            : const MaterialStatePropertyAll(kWhite),
      ),
      child: TsText(
        text,
        size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? mobileTabletTextSize ?? 15
            : desktopTextSize ?? 16,
      ),
    );
  }
}
