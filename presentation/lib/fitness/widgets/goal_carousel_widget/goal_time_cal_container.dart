import 'package:flutter/material.dart';

import '../../../../resources/custom_colors.dart';
import '../../../../resources/svg_assets.dart';
import '../exercise_properties_widget.dart';

class GoalTimeCalContainer extends StatelessWidget {
  const GoalTimeCalContainer({super.key, required this.burnCalories, required this.durationSeconds});

  final int burnCalories;
  final int durationSeconds;

  @override
  Widget build(BuildContext context) {

    var durationMinutes = (durationSeconds / 60).ceilToDouble();
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12.0, top: 16.0, bottom: 16.0),
          width: 85,
          height: 32,
          decoration: BoxDecoration(
            color: CustomColors.honeydew,
            border: Border.all(color: CustomColors.yellowGreen),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ExercisePropertiesWidget(
            icon: SvgAssets.iconClock,
            content: "$durationMinutes min",
            color: CustomColors.yellowGreen,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
          width: 85,
          height: 32,
          decoration: BoxDecoration(
            color: CustomColors.floralWhite,
            border: Border.all(color: CustomColors.uclaGold),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ExercisePropertiesWidget(
              content: "$burnCalories cal",
              color: CustomColors.uclaGold,
              icon: SvgAssets.iconFire),
        ),
      ],
    );
  }
}
