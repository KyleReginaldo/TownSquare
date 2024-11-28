import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:townsquare/presentation/widgets/typography/ts_text.dart';

import '../../../core/constant/icons.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TsText(
          'Tues, Nov 12',
          size:
              ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 12 : 14,
          weight: FontWeight.w500,
          color: const Color(0xFF9B9B9B),
        ),
        const SizedBox(width: 8),
        if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP))
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  kBell,
                  height: 3.h,
                  width: 3.h,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    height: 4.h,
                    width: 4.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
