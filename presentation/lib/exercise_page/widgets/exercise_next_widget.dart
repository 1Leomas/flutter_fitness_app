import 'package:flutter/material.dart';

import '../../resources/custom_colors.dart';
import '../../resources/text_styles.dart';

class ExerciseNextWidget extends StatelessWidget {
  const ExerciseNextWidget({Key? key, required this.nextTitle}) : super(key: key);

  final String nextTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "Next",
          style: TextStyles.poppins14(color: CustomColors.spanishGray),
        ),
        Text(
          nextTitle,
          style: TextStyles.poppins18(),
        )
      ],
    );
  }
}
