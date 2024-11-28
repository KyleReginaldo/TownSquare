// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/theme/colors.dart';

class TsCircularProgressBar extends StatelessWidget {
  const TsCircularProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 35,
      animation: true,
      animationDuration: 400,
      lineWidth: 8,
      percent: 0.7,
      center: Text(
        "27",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize:
              ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 25 : 27,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: kWhite,
      progressColor: kPrimary600,
    );
  }
}
