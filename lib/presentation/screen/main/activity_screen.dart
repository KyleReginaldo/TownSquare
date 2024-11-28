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
import '../extension/ts_search_delegate.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  String selectedCategory = 'All';
  late AnimationController controller;
  late Animation<double> animation;
  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
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
    return Builder(builder: (context) {
      final columnHeight = context.select(
        (TimelineDisplayCubit bloc) => bloc.state,
      );
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 24),
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<AvailableActivityCubit>().onFetchAvailableActivities(
                  category:
                      selectedCategory.isEmpty ? 'All' : selectedCategory);
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
                        child: TsText(
                          'This week in Estepona',
                          size: ResponsiveBreakpoints.of(context)
                                  .smallerThan(DESKTOP)
                              ? 20
                              : 24,
                          weight: FontWeight.w500,
                        ),
                      ),
                      if (ResponsiveBreakpoints.of(context)
                          .smallerThan(DESKTOP))
                        const SizedBox(height: 16),
                      if (ResponsiveBreakpoints.of(context)
                          .smallerThan(DESKTOP))
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
                        child: TsSearchBar(
                          onTap: () async {
                            await showSearch(
                              context: context,
                              delegate: TsSearchDelegate(),
                            ).then((value) {
                              if (value != null) {
                                selectedCategory = value;
                                context
                                    .read<AvailableActivityCubit>()
                                    .onFetchAvailableActivities(
                                        category: value);
                              }
                            });
                          },
                        ),
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
                                        .onFetchAvailableActivities(
                                            category: e);
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
                                        gap: 7,
                                        dash: 5,
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
                                                ? 16
                                                : 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' / tuesday',
                                          style: TextStyle(
                                            color: kNeutral600,
                                            fontSize: ResponsiveBreakpoints.of(
                                                        context)
                                                    .smallerThan(DESKTOP)
                                                ? 14
                                                : 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const AvailableActivity(),
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
    });
  }
}
