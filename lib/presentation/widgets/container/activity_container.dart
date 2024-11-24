// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../core/constant/icons.dart';
import '../../../core/theme/colors.dart';
import '../typography/ts_text.dart';

class ActivityContainer extends StatelessWidget {
  final String title;
  final String time;
  final String duration;
  final List<String> tags;
  final String location;
  final double price;
  final int spots;
  final bool joined;
  final VoidCallback? onTap;
  const ActivityContainer({
    super.key,
    required this.title,
    required this.time,
    required this.duration,
    required this.tags,
    required this.location,
    required this.price,
    required this.spots,
    required this.joined,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: kWhite,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: time,
                    style: TextStyle(
                      color: kBlack,
                      fontSize:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? 14
                              : 15,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: ' ($duration) ',
                        style: const TextStyle(
                          color: kNeutral600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TsText(
                  title,
                  size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? 16
                      : 18,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      kMapPin,
                    ),
                    SizedBox(width: 0.1.w),
                    TsText(
                      location,
                      color: kNeutral600,
                      size:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? 15
                              : 16,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 5,
                  children: [
                    Container(
                      width:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? 112
                              : 132,
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            kUser,
                            height: 15,
                            width: 15,
                          ),
                          const SizedBox(width: 4),
                          TsText(
                            '$spots spots left',
                            color: const Color(0xFF9E9E9E),
                            weight: FontWeight.w600,
                            size: ResponsiveBreakpoints.of(context)
                                    .smallerThan(DESKTOP)
                                ? 14
                                : 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ...tags.map(
                      (e) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: getTagColor(e).background,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: TsText(
                          e,
                          color: getTagColor(e).title,
                          weight: FontWeight.w600,
                          size: ResponsiveBreakpoints.of(context)
                                  .smallerThan(DESKTOP)
                              ? 14
                              : 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: MediaQuery.sizeOf(context).width < 600
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.end,
            children: [
              TsText(
                '9€',
                size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? 15.sp
                    : 12.sp,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 8),
              joined
                  ? ElevatedButton(
                      onPressed: (spots < 1 && !joined) ? null : onTap,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          kBlack,
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: TsText(
                          'Joined',
                          size: 15,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: (spots < 1 && !joined) ? null : onTap,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          spots < 1 ? kNeutral500 : kBlack,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: TsText(
                          spots < 1 ? 'Sold out' : 'Join',
                          size: 15,
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
