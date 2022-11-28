import 'package:domain/fitness/models/goal.dart';
import 'package:flutter/material.dart';

import 'goal_time_cal_container.dart';
import 'goal_image_widget.dart';
import 'goal_title_description_widget.dart';

class GoalContentWidget extends StatelessWidget {
  const GoalContentWidget({Key? key, required this.goal}) : super(key: key);

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GoalImageWidget(image: goal.image),
        GoalTitleDescriptionWidget(title: goal.title, description: goal.description),
        GoalTimeCalContainer(burnCalories: goal.burnCalories, durationSeconds: goal.durationSeconds),
      ],
    );
  }
}
