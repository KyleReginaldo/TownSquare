// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/theme/colors.dart';
import '../typography/ts_text.dart';

class SideBarContainer extends StatelessWidget {
  final String? image;
  final double? height;
  final String title;
  final String? topTitle;
  final String subtitle;
  final Widget button;
  final Color? color;
  final Color? textColor;
  const SideBarContainer({
    super.key,
    this.image,
    this.height,
    required this.title,
    this.topTitle,
    required this.subtitle,
    required this.button,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color ?? kSecondaryYellow200,
          borderRadius: BorderRadius.circular(10),
          image: image != null
              ? DecorationImage(
                  image: AssetImage(
                    image!,
                  ),
                  fit: BoxFit.cover,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: kBlack.withOpacity(
                0.12,
              ),
              offset: const Offset(
                2,
                4,
              ),
              spreadRadius: 0.5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (topTitle != null)
              TsText(
                topTitle!,
                size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? 15
                    : 18,
                color: textColor ?? kWhite,
              ),
            const Spacer(),
            TsText(
              title,
              size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? 15
                  : 18,
              color: textColor ?? kWhite,
            ),
            const SizedBox(height: 8),
            TsText(
              subtitle,
              size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? 14
                  : 16,
              weight: FontWeight.w500,
              color: textColor ?? kWhite,
            ),
            const SizedBox(height: 16),
            button,
          ],
        ),
      ),
    );
  }
}
