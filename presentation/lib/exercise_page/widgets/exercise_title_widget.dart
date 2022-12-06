import 'package:flutter/material.dart';

import '../../resources/text_styles.dart';

class ExerciseTitleWidget extends StatelessWidget {
  const ExerciseTitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ready to go",
          style: TextStyles.poppins28(),
        ),

        const SizedBox(height: 16),

        Text(
          title,
          style: TextStyles.poppins18(),
        ),
      ],
    );
  }
}
