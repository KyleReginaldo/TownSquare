// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:townsquare/presentation/widgets/container/ts_state_container.dart';

import '../../../core/theme/colors.dart';
import '../../../core/usecase/usecase.dart';
import '../../bloc/available_activity/available_activity_cubit.dart';
import '../container/activity_container.dart';
import '../typography/ts_text.dart';

class AvailableActivity extends StatefulWidget {
  final GlobalKey columnKey;
  const AvailableActivity({
    super.key,
    required this.columnKey,
  });

  @override
  State<AvailableActivity> createState() => _AvailableActivityState();
}

class _AvailableActivityState extends State<AvailableActivity>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500),
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
  void dispose() {
    // controller.dispose();
    // animation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvailableActivityCubit, AvailableActivityState>(
      listener: (context, state) {
        if (state is AvailableActivityLoaded) {
          controller.reset();
          controller.forward();
        } else if (state is AvailableActivityEmpty) {
          controller.reset();
          controller.forward();
        }
      },
      builder: (context, state) {
        if (state is AvailableActivityLoaded) {
          return Column(
            key: widget.columnKey,
            children: state.activities
                .map((e) => FadeTransition(
                      key: Key('${e.id}'),
                      opacity: animation,
                      child: ActivityContainer(
                        location: e.location,
                        price: e.price,
                        tags: e.tags,
                        time: e.time,
                        duration: e.duration,
                        title: e.title,
                        spots: e.availableSpots,
                        joined: e.joined,
                        onTap: () async {
                          if (!e.joined) {
                            await joinActivity(id: e.id).then((value) {
                              if (value) {
                                setState(() {
                                  e.availableSpots--;
                                  e.joined = true;
                                });
                                debugPrint(e.joined.toString());
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: TsText(
                                      'Something went wrong.',
                                    ),
                                  ),
                                );
                              }
                            });
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog.adaptive(
                                    backgroundColor: kWhite,
                                    surfaceTintColor: kWhite,
                                    title: const TsText(
                                      'Unjoin',
                                      weight: FontWeight.bold,
                                    ),
                                    content: const TsText(
                                      'Are you sure you want to unjoin?',
                                    ),
                                    actions: [
                                      TextButton(
                                        style: const ButtonStyle(
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.red),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const TsText('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await unjoinActivity(id: e.id)
                                              .then((value) {
                                            if (value) {
                                              setState(() {
                                                e.availableSpots++;
                                                e.joined = false;
                                              });
                                              Navigator.pop(context);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: TsText(
                                                    'Something went wrong.',
                                                  ),
                                                ),
                                              );
                                            }
                                          });
                                        },
                                        child: const TsText('Unjoin'),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                      ),
                    ))
                .toList(),
          );
        } else if (state is AvailableActivityLoading) {
          return Column(
            children: List.generate(
              5,
              (index) => Shimmer.fromColors(
                baseColor: kNeutral200,
                highlightColor: kNeutral100,
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 64,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: kNeutral200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          );
        } else if (state is AvailableActivityEmpty) {
          return Center(
              child: FadeTransition(
                  opacity: animation,
                  child: TsStateContainer.empty(height: 128)));
        }
        return const SizedBox();
      },
    );
  }
}
