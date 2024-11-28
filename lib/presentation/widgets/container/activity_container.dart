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
      padding: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            )
          : const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 12,
            ),
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
                    style: const TextStyle(
                      color: kBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: ' ($duration) ',
                        style: const TextStyle(
                          color: kNeutral500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TsText(
                  title,
                  size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? 14
                      : 20,
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
                      color: kNeutral500,
                      weight: FontWeight.w500,
                      size:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? 12
                              : 14,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 5,
                  spacing: 5,
                  children: [
                    Container(
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            kUser,
                            height: 12,
                            width: 12,
                          ),
                          const SizedBox(width: 4),
                          TsText(
                            '$spots spots left',
                            color: kNeutral500,
                            weight: FontWeight.w500,
                            size: ResponsiveBreakpoints.of(context)
                                    .smallerThan(DESKTOP)
                                ? 10
                                : 12,
                          ),
                        ],
                      ),
                    ),
                    ...tags.map(
                      (e) => Container(
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
                          weight: FontWeight.bold,
                          size: ResponsiveBreakpoints.of(context)
                                  .smallerThan(DESKTOP)
                              ? 10
                              : 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TsText(
                '${price.toStringAsFixed(0)}€',
                size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? 14
                    : 20,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 12),
              joined
                  ? ElevatedButton(
                      onPressed: (spots < 1 && !joined) ? null : onTap,
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          kBlack,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: TsText(
                          'Joined',
                          size: 14,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: (spots < 1 && !joined) ? null : onTap,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          spots < 1 ? kNeutral500 : kBlack,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: TsText(
                          spots < 1 ? 'Sold out' : 'Join',
                          size: 14,
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
