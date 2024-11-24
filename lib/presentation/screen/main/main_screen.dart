import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:townsquare/core/constant/icons.dart';
import 'package:townsquare/core/utils/utils.dart';

import '../../../core/theme/colors.dart';
import '../../bloc/bloc.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final pageController = PageController(keepPage: true);
  int currentPage = 0;
  late AnimationController controller;
  late Animation<double> animation;

  List<Widget> pages = [
    const ActivityScreen(),
    const NoContentScreen(),
    const NoContentScreen(),
    const NoContentScreen(),
    const NoContentScreen(),
  ];
  @override
  void initState() {
    context.read<AvailableActivityCubit>().onFetchAvailableActivities();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
          ? PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return pages[index];
              })
          : SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Row(
                children: [
                  const SideBar(),
                  Expanded(
                    flex: 7,
                    child: PageView.builder(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return pages[index];
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4.h, right: 2.h),
                    width: MediaQuery.sizeOf(context).width * 0.22,
                    child: Column(
                      children: [
                        if (ResponsiveBreakpoints.of(context)
                            .largerThan(TABLET))
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: FadeTransition(
                                opacity: animation,
                                child: const ProgressContainer()),
                          ),
                        SizedBox(height: 2.h),
                        if (ResponsiveBreakpoints.of(context)
                            .largerThan(TABLET))
                          FadeTransition(
                            opacity: animation,
                            child: SideBarContainer(
                              height: 240,
                              title: 'Weekly workshops for kids',
                              textColor: kBlack,
                              subtitle:
                                  'Sign up for early access to weekly activities for your kids full of learning and fun!',
                              button: InkWell(
                                onTap: () {
                                  Utils.showInprogressBar(context: context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TsText(
                                        'Learn more',
                                        size: ResponsiveBreakpoints.of(context)
                                                .smallerThan(DESKTOP)
                                            ? 15
                                            : 16,
                                        weight: FontWeight.w600,
                                      ),
                                      const Icon(
                                        Icons.arrow_circle_right_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 2.h),
                        if (ResponsiveBreakpoints.of(context)
                            .largerThan(TABLET))
                          FadeTransition(
                            opacity: animation,
                            child: SideBarContainer(
                              image: 'assets/images/popular_events.png',
                              height: 300,
                              title: '',
                              topTitle: 'Popular events near you!',
                              subtitle:
                                  'Unleash the fun! Explore the world of exciting events happening near you.',
                              button: Center(
                                child: InkWell(
                                  onTap: () {
                                    Utils.showInprogressBar(context: context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 4.h),
                                    padding: const EdgeInsets.all(10),
                                    width: 188,
                                    height: 39,
                                    decoration: BoxDecoration(
                                        color: kWhite,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const TsText(
                                      'See more',
                                      size: 15,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar:
          ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
              ? buildNavigationBar()
              : null,
    );
  }

  Widget buildNavigationBar() {
    return BottomNavigationBar(
      selectedFontSize: 8,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentPage,
      onTap: (page) {
        setState(() {
          currentPage = page;
          pageController.jumpToPage(
            page,
            // duration: const Duration(milliseconds: 200),
            // curve: Curves.easeInOut,
          );
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            kCalendar,
            color: currentPage == 0 ? kBlack : kNeutral600,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            kMap,
            color: currentPage == 1 ? kBlack : kNeutral600,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            kPlus,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            kUsers,
            color: currentPage == 3 ? kBlack : kNeutral600,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            kStar,
            color: currentPage == 4 ? kBlack : kNeutral600,
          ),
          label: '',
        ),
      ],
    );
  }
}
