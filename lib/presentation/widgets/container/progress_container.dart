import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:townsquare/core/utils/utils.dart';

import '../../../core/theme/colors.dart';
import '../widgets.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.h,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: kPrimary200,
        borderRadius: BorderRadius.circular(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TsText(
            'You\'re close to your goal!',
            size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? 15
                : 20,
            weight: FontWeight.w600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? 8
                              : 16,
                    ),
                    TsText(
                      'Join more sport activities to\ncollect more points',
                      size:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? 15
                              : 14,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? 8
                              : 16,
                    ),
                    Row(
                      children: [
                        TsElevatedButton(
                          'Join now',
                          desktopTextSize: 14,
                          mobileTabletTextSize: 14,
                          onTap: () {
                            Utils.showInprogressBar(context: context);
                          },
                        ),
                        const SizedBox(width: 8),
                        TsElevatedButton(
                          'My points',
                          desktopTextSize: 14,
                          mobileTabletTextSize: 14,
                          onTap: () {
                            Utils.showInprogressBar(context: context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (ResponsiveBreakpoints.of(context).largerThan(DESKTOP) ||
                  ResponsiveBreakpoints.of(context).smallerThan(DESKTOP))
                const TsCircularProgressBar(),
            ],
          ),
        ],
      ),
    );
  }
}
