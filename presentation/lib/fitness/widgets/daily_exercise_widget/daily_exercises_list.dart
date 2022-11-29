import 'package:domain/fitness/models/exercise.dart';
import 'package:flutter/material.dart';

//import 'daily_exercise.dart';

class DailyExercisesList extends StatefulWidget {
  const DailyExercisesList({Key? key, required this.exercises})
      : super(key: key);

  final List<Exercise> exercises;

  @override
  State<DailyExercisesList> createState() => _DailyExercisesListState();
}

class _DailyExercisesListState extends State<DailyExercisesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          //decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent),),
          /*child: ListView.builder(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            itemCount: widget.exercises.length,
            itemBuilder: (_, i) {
              var exercise = widget.exercises[i];
              return Column(
                children: [
                  DailyExercise(exercise: exercise),
                  const SizedBox(height: 12),
                ],
              );
            },
          ),*/
        )
    );
  }
}
