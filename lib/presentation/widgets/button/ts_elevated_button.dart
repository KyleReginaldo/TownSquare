// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../widgets.dart';

class TsFilledButton extends StatelessWidget {
  final Color? bgColor;
  final Color? color;
  final VoidCallback? onTap;
  final String text;
  const TsFilledButton({
    super.key,
    this.bgColor,
    this.color,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: bgColor ?? kBlack,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TsText(
          text,
          color: color ?? kWhite,
          size: 12,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
