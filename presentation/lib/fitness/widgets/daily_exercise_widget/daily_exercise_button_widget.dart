import 'package:domain/fitness/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/custom_colors.dart';
import '../../../../resources/svg_assets.dart';
import '../../../exercise_page/exercise_page.dart';

class DailyExerciseButton extends StatelessWidget {
  const DailyExerciseButton({Key? key, required this.exercise}) : super(key: key);

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: SizedBox(
          //height: 32,
          //decoration: BoxDecoration(border: Border.all(color: Colors.red),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.cultured,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: const CircleBorder(
                      side: BorderSide(color: CustomColors.brightGray),
                    ),
                  ),
                  onPressed: () {
                    Get.to(ExercisePage(exercise: exercise));
                  },
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: SvgAssets.iconPlay,
                  ),
              ),
            ],
          ),
        ),
    );
  }
}
