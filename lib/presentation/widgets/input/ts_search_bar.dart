import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../core/constant/icons.dart';
import '../../../core/theme/colors.dart';

class TsSearchBar extends StatelessWidget {
  const TsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'What do you feel like doing?',
      hintStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF9E9E9E),
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
          vertical: 5,
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(kWhite),
      surfaceTintColor: const MaterialStatePropertyAll(kWhite),
    );
  }
}
