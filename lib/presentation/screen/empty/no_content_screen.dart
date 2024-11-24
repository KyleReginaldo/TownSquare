import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class NoContentScreen extends StatelessWidget {
  const NoContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TsText('Currently no data.'),
    );
  }
}
