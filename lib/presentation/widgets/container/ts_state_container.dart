import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TsStateContainer extends StatefulWidget {
  const TsStateContainer({
    super.key,
    required this.child,
    required this.title,
    this.height = 250,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 8,
    ),
    required this.subtitle,
    this.actions = const [],
  });
  final Widget child;
  final String title;
  final String subtitle;
  final EdgeInsetsGeometry padding;
  final List<Widget> actions;
  final double height;

  // factory TsStateContainer.error({
  //   String? title,
  //   String? subtitle,
  //   Widget? child,
  //   List<Widget> actions = const [],
  //   double height = 250,
  //   String? image,
  //   EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
  //     horizontal: 8,
  //   ),
  // }) {
  //   return TsStateContainer(
  //     title: title ?? 'Oops! Something went wrong.',
  //     subtitle: subtitle ??
  //         'An error occurred while processing. Please try again later.',
  //     actions: actions,
  //     height: height,
  //     padding: padding,
  //     child: child,
  //   );
  // }

  // factory TsStateContainer.success({
  //   String? title,
  //   String? subtitle,
  //   Widget? child,
  //   List<Widget> actions = const [],
  //   double height = 250,
  //   EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
  //     horizontal: 8,
  //   ),
  // }) {
  //   return TsStateContainer(
  //     title: title ?? 'Success!',
  //     subtitle: subtitle ?? 'Your request has been processed successfully.',
  //     actions: actions,
  //     height: height,
  //     padding: padding,
  //     child: child ?? SvgPicture.asset(),
  //   );
  // }

  factory TsStateContainer.empty({
    String? title,
    String? subtitle,
    Widget? child,
    List<Widget> actions = const [],
    double height = 250,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 8,
    ),
  }) {
    return TsStateContainer(
      title: title ?? 'Empty',
      subtitle: subtitle ?? 'There is no data to display.',
      actions: actions,
      height: height,
      padding: padding,
      child: child ??
          SvgPicture.asset(
            'assets/svg/no-activity.svg',
            fit: BoxFit.contain,
          ),
    );
  }

  @override
  State<TsStateContainer> createState() => _TsStateContainerState();
}

class _TsStateContainerState extends State<TsStateContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: widget.height,
            margin: const EdgeInsets.only(bottom: 20),
            child: widget.child,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: widget.actions,
          ),
        ],
      ),
    );
  }
}
