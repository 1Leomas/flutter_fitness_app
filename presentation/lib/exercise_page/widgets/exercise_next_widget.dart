import 'package:flutter/material.dart';

import '../../resources/custom_colors.dart';
import '../../resources/text_styles.dart';

class ExerciseNextWidget extends StatelessWidget {
  const ExerciseNextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "Next",
          style: TextStyles.poppins14(color: CustomColors.spanishGray),
        ),
        Text(
            "Incline Push-Ups",
          style: TextStyles.poppins18(),
        )
      ],
    );
  }
}
