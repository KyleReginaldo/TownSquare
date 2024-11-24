// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/theme/colors.dart';

class TsCircularProgressBar extends StatelessWidget {
  const TsCircularProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 48,
      animation: true,
      animationDuration: 400,
      lineWidth: 8,
      percent: 0.7,
      center: const Text(
        "27",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: kWhite,
      progressColor: kPrimary600,
    );
  }
}
