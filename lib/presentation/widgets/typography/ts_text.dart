// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TsText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final double? letterSpacing;
  const TsText(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 15,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        height: 1,
      ),
    );
  }
}
