import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:townsquare/core/utils/utils.dart';

import '../../../core/theme/colors.dart';
import '../widgets.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TsText(
                  'You\'re close to your goal!',
                  size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? 16
                      : 20,
                  weight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 16,
                ),
                const TsText(
                  'Join more sport activities to\ncollect more points',
                  size: 12,
                  weight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 16,
                ),
                Wrap(
                  runSpacing: 5,
                  spacing: 5,
                  children: [
                    TsFilledButton(
                      text: 'Join now',
                      onTap: () {
                        Utils.showInprogressBar(context: context);
                      },
                    ),

                    TsFilledButton(
                      text: 'My points',
                      onTap: () {
                        Utils.showInprogressBar(context: context);
                      },
                    ),
                    // TsElevatedButton(
                    //   'Join now',
                    //   desktopTextSize: 12,
                    //   mobileTextSize: 12,
                    //   tabletTextSize: 12,
                    //   onTap: () {
                    //     Utils.showInprogressBar(context: context);
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
          const TsCircularProgressBar(),
        ],
      ),
    );
  }
}



//  Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TsText(
//             'You\'re close to your goal!',
//             size: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                 ? 16
//                 : 20,
//             weight: FontWeight.w500,
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // if (ResponsiveBreakpoints.of(context)
//                     //     .largerThan(TABLET)) ...{
//                     //   const SizedBox(height: 8),
//                     //   const TsCircularProgressBar(),
//                     // },
//                     const TsText(
//                       'Join more sport activities to\ncollect more points',
//                       size: 12,
//                       weight: FontWeight.w500,
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     Wrap(
//                       runSpacing: 5,
//                       spacing: 5,
//                       children: [
//                         TsElevatedButton(
//                           'Join now',
//                           desktopTextSize: 12,
//                           mobileTextSize: 12,
//                           tabletTextSize: 12,
//                           onTap: () {
//                             Utils.showInprogressBar(context: context);
//                           },
//                         ),
//                         TsElevatedButton(
//                           'My points',
//                           desktopTextSize: 12,
//                           mobileTextSize: 12,
//                           tabletTextSize: 12,
//                           onTap: () {
//                             Utils.showInprogressBar(context: context);
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               // if (ResponsiveBreakpoints.of(context).smallerThan(TABLET))
//               const TsCircularProgressBar(),
//             ],
//           ),
//         ],
//       ),
