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
      width: 250,
      color: kBlack,
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Image.asset('assets/images/townsquare.png'),
          SizedBox(height: 4.h),
          ListTile(
            onTap: () {
              Utils.showInprogressBar(context: context);
            },
            leading: SvgPicture.asset(
              kCalendar,
              color: kWhite,
            ),
            title: const TsText(
              'Activities',
              color: kWhite,
              size: 15,
            ),
          ),
          SizedBox(height: 2.h),
          ListTile(
            onTap: () {
              Utils.showInprogressBar(context: context);
            },
            leading: SvgPicture.asset(
              kMap,
              color: kWhite,
            ),
            title: const TsText(
              'Locations',
              color: kWhite,
              size: 15,
            ),
          ),
          SizedBox(height: 2.h),
          ListTile(
            onTap: () {
              Utils.showInprogressBar(context: context);
            },
            leading: SvgPicture.asset(
              kStar,
              color: kWhite,
            ),
            title: const TsText(
              'Services',
              color: kWhite,
              size: 15,
            ),
          ),
          SizedBox(height: 2.h),
          ListTile(
            onTap: () {
              Utils.showInprogressBar(context: context);
            },
            leading: SvgPicture.asset(
              kUsers,
              color: kWhite,
            ),
            title: const TsText(
              'Communities',
              color: kWhite,
              size: 15,
            ),
          ),
          SizedBox(height: 2.h),
          ListTile(
            onTap: () {
              Utils.showInprogressBar(context: context);
            },
            leading: SvgPicture.asset(
              kBell,
              color: kWhite,
            ),
            title: const TsText(
              'Notification',
              color: kWhite,
              size: 15,
            ),
          ),
          SizedBox(height: 2.h),
          ListTile(
            onTap: () {
              Utils.showInprogressBar(context: context);
            },
            title: ElevatedButton.icon(
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
                size: 15,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          ListTile(
            onTap: () {
              Utils.showInprogressBar(context: context);
            },
            leading: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                height: 3.h,
                width: 3.h,
                fit: BoxFit.cover,
              ),
            ),
            title: const TsText(
              'Profile',
              color: kWhite,
              size: 15,
            ),
            trailing: Icon(
              Icons.more_vert,
              color: kWhite,
              size: 2.h,
            ),
          ),
        ],
      ),
    );
  }
}
