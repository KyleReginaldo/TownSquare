// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../core/constant/icons.dart';
import '../../../core/theme/colors.dart';

class TsSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  const TsSearchBar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'What do you feel like doing?',
      onTap: onTap,
      hintStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontSize: 14,
          color: kNeutral500,
        ),
      ),
      trailing: [
        SvgPicture.asset(
          kSearch,
          color: kNeutral500,
        ),
      ],
      elevation: const MaterialStatePropertyAll(4),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(fontSize: 14),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(kWhite),
      surfaceTintColor: const MaterialStatePropertyAll(kWhite),
    );
  }
}
