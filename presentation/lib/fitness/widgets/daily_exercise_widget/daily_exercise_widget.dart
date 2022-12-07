import 'package:domain/fitness/models/exercise.dart';
import 'package:flutter/material.dart';

import 'daily_exercise_button_widget.dart';
import 'daily_exercise_content_widget.dart';
import 'daily_exercise_image_widget.dart';

class DailyExercise extends StatelessWidget {
  const DailyExercise({Key? key, required this.exercise}) : super(key: key);

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
      height: 48, //48
      //decoration: BoxDecoration(border: Border.all(color: Colors.red),),
      child: Row(
        children: [
          DailyExerciseImage(image: exercise.image),
          const SizedBox(width: 16),
          DailyExerciseContent(
              title: exercise.title,
              durationSeconds: exercise.durationSeconds,
              caloriesCount: exercise.burnCalories
          ),
          DailyExerciseButton(exercise: exercise),
        ],
      ),
    );
  }
}
