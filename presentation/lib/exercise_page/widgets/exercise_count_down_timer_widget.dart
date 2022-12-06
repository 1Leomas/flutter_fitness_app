import 'package:fitness_app_flutter/resources/svg_assets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../resources/custom_colors.dart';
import '../../resources/text_styles.dart';


class ExerciseCountDownTimerWidget extends StatelessWidget {
  const ExerciseCountDownTimerWidget({Key? key, required this.durationSeconds}) : super(key: key);

  final double durationSeconds;

  @override
  Widget build(BuildContext context) {

    double time = (durationSeconds > 0) ? (durationSeconds/60).ceilToDouble() : 1;

    return Container(
      height: 166,
      width: 166,
      //decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1),),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: time,
            backgroundColor: CustomColors.cultured,
            color: CustomColors.cyanCornflowerBlue,
            strokeWidth: 12,
          ),
          Center(
            child: Text(
              "$time",
              style: TextStyles.poppins52(),
            ),
          ),
        ],
      ),
    );
  }
}
