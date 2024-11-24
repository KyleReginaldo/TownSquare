// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../typography/ts_text.dart';

class CategoryContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color? color;
  const CategoryContainer({
    super.key,
    this.onTap,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TsText(
          text,
          size: 16,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
