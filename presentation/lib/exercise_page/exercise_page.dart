import 'package:domain/fitness/models/exercise.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_count_down_timer_widget.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_header_widget.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_next_widget.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_title_widget.dart';
import 'package:fitness_app_flutter/fitness/models/exercise_list_item.dart';
import 'package:fitness_app_flutter/resources/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;


import '../fitness/fitness_controller.dart';
import '../resources/svg_assets.dart';
import 'exercise_controller.dart';
import 'widgets/exercise_image_widget.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key, required this.exercise}) : super(key: key);
  final Exercise exercise;
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  void initState() {
    Get.put(ExerciseController());

    ExerciseController controller = Get.find();

    controller.seconds.value = widget.exercise.durationSeconds;

    controller.resetTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FitnessController controller = Get.find();

    Exercise exerciseFirst = (controller.exercisesList.first as ExerciseListItem).exercise;

    Exercise exerciseLast = (controller.exercisesList[controller.exercisesList.length-2] as ExerciseListItem).exercise;

    Exercise exerciseNext = (controller.exercisesList[widget.exercise.id+1] as ExerciseListItem).exercise;


    // print(" current id: ${widget.exercise.id}");
    // print(" next id: ${exerciseNext.id}");
    // print(" first id : ${exerciseFirst.id}");
    // print(" last id : ${exerciseLast.id}");

    // for(int i = 0; i < controller.exercisesList.length; i++) {
    //   var item = controller.exercisesList[i];
    //   if( item is ExerciseListItem) {
    //     print("---- i[$i] id: ${item.exercise.id}");
    //   } else {
    //     print(" ----i[$i] is not exercise");
    //   }
    // }


    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: CustomColors.lotion,
          //border: Border.all(color: Colors.red, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ExerciseHeaderWidget(index: widget.exercise.id),

            ExerciseImageWidget(image: widget.exercise.image),

            ExerciseTitleWidget(title: widget.exercise.title),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                widget.exercise != exerciseFirst ?
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.lotion,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {

                    var exercise = (controller.exercisesList[widget.exercise.id-1] as ExerciseListItem).exercise;

                    Get.off(
                        ExercisePage(exercise: exercise),
                        preventDuplicates: false
                    );
                  },
                  child: SvgAssets.svgBack,
                )
                : Container(width: 60,),

                const SizedBox(width: 24),

                const ExerciseCountDownTimerWidget(),

                const SizedBox(width: 24),

                widget.exercise != exerciseLast ?
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.lotion,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    Get.off(ExercisePage(exercise: exerciseNext), preventDuplicates: false);
                  },
                  child: Transform.rotate(
                    angle: 180 * math.pi / 180,
                    child: SvgAssets.svgBack,
                  ),
                )
                : Container(width: 60,),

              ],
            ),

            if (widget.exercise != exerciseLast)
              ExerciseNextWidget(nextTitle: exerciseNext.title)
            else Container(),

          ],
        ),
      ),
    );
  }
}
