import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:townsquare/core/utils/utils.dart';

import '../../../core/constant/icons.dart';
import '../../../core/theme/colors.dart';
import '../typography/ts_text.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
      width: 275,
      color: kBlack,
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Image.asset('assets/images/townsquare.png'),
          SizedBox(height: 4.h),
          SizedBox(
            width: 180,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Utils.showInprogressBar(context: context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        kCalendar,
                        color: kWhite,
                      ),
                      const SizedBox(width: 16),
                      const TsText(
                        'Activities',
                        color: kWhite,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Utils.showInprogressBar(context: context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        kMap,
                        color: kWhite,
                      ),
                      const SizedBox(width: 16),
                      const TsText(
                        'Locations',
                        color: kWhite,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Utils.showInprogressBar(context: context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        kStar,
                        color: kWhite,
                      ),
                      const SizedBox(width: 16),
                      const TsText(
                        'Services',
                        color: kWhite,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Utils.showInprogressBar(context: context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        kUsers,
                        color: kWhite,
                      ),
                      const SizedBox(width: 16),
                      const TsText(
                        'Communities',
                        color: kWhite,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Utils.showInprogressBar(context: context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        kBell,
                        color: kWhite,
                      ),
                      const SizedBox(width: 16),
                      const TsText(
                        'Notifications',
                        color: kWhite,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      kPrimary600,
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                    ),
                    foregroundColor: const MaterialStatePropertyAll(kBlack),
                    fixedSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.sizeOf(context).width * 0.6,
                        2.h,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Utils.showInprogressBar(context: context);
                  },
                  icon: const Icon(Icons.add),
                  label: const TsText(
                    'Create',
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Utils.showInprogressBar(context: context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const TsText(
                            'Profile',
                            color: kWhite,
                            size: 20,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_vert,
                        color: kWhite,
                        size: 2.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
