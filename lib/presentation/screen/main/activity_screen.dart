import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:townsquare/core/constant/data.dart';
import 'package:townsquare/core/constant/icons.dart';
import 'package:townsquare/core/theme/colors.dart';

import '../../bloc/bloc.dart';
import '../../widgets/widgets.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  final GlobalKey columnKey = GlobalKey();
  double? columnHeight;
  String selectedCategory = 'All';
  late AnimationController controller;
  late Animation<double> animation;

  void getColumnHeight() {
    final RenderBox renderBox =
        columnKey.currentContext!.findRenderObject() as RenderBox;
    setState(() {
      columnHeight = renderBox.size.height;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getColumnHeight();
    });
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
      value: 0,
      lowerBound: 0,
      upperBound: 1,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 24),
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<AvailableActivityCubit>().onFetchAvailableActivities();
            controller.reset();
            controller.forward();
          },
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: ResponsiveValue(
                    context,
                    conditionalValues: [
                      const Condition.largerThan(name: MOBILE, value: 900.0)
                    ],
                    defaultValue: double.infinity,
                  ).value,
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveBreakpoints.of(context)
                                  .smallerThan(DESKTOP)
                              ? 2.h
                              : 4.h),
                      child: const HomeHeader(),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveBreakpoints.of(context)
                                  .smallerThan(DESKTOP)
                              ? 2.h
                              : 4.h),
                      child: const TsText(
                        'This week in Estepona',
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ),
                    if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP))
                      const SizedBox(height: 16),
                    if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP))
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: FadeTransition(
                            opacity: animation,
                            child: const ProgressContainer()),
                      ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveBreakpoints.of(context)
                                  .smallerThan(DESKTOP)
                              ? 2.h
                              : 4.h),
                      child: const TsSearchBar(),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: ResponsiveBreakpoints.of(context)
                                    .smallerThan(DESKTOP)
                                ? 2.h
                                : 4.h),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(right: 2),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: kSecondaryPurple200,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: SvgPicture.asset(kSliders),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ...kCategories.map(
                              (e) => CategoryContainer(
                                text: e,
                                onTap: () {
                                  setState(() {
                                    selectedCategory = e;
                                  });
                                  context
                                      .read<AvailableActivityCubit>()
                                      .onFetchAvailableActivities(category: e);
                                },
                                color: selectedCategory == e
                                    ? kSecondaryPurple400
                                    : kSecondaryPurple200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveBreakpoints.of(context)
                                  .smallerThan(DESKTOP)
                              ? 2.h
                              : 4.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (context.select(
                                  (AvailableActivityCubit bloc) => bloc.state)
                              is AvailableActivityLoaded)
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: kSecondaryYellow300,
                                    radius: 8,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: columnHeight ??
                                        MediaQuery.sizeOf(context).height,
                                    child: const DashedLineConnector(
                                      color: kNeutral300,
                                      gap: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Today',
                                    style: TextStyle(
                                      color: kBlack,
                                      fontSize:
                                          ResponsiveBreakpoints.of(context)
                                                  .smallerThan(DESKTOP)
                                              ? 15
                                              : 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: ' / tuesday',
                                        style: TextStyle(
                                          color: kNeutral600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AvailableActivity(
                                  columnKey: columnKey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
