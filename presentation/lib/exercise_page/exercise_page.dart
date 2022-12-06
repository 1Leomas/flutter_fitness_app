import 'package:domain/fitness/models/exercise.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_count_down_timer_widget.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_header_widget.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_next_widget.dart';
import 'package:fitness_app_flutter/exercise_page/widgets/exercise_title_widget.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FitnessController controller = Get.find();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: CustomColors.lotion,
          //border: Border.all(color: Colors.red, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //const SizedBox(height: 48),

            ExerciseHeaderWidget(index: widget.exercise.id),

            //const SizedBox(height: 32),

            //ExerciseImageWidget(image: widget.exercise.image),

            //const SizedBox(height: 32),

            ExerciseTitleWidget(title: widget.exercise.title),

            //const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                widget.exercise != controller.exercises.first ?
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.lotion,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    Get.to(ExercisePage(exercise: controller.exercises[widget.exercise.id-1]));
                  },
                  child: SvgAssets.svgBack,
                )
                : Container(width: 60,),

                const SizedBox(width: 24),

                ExerciseCountDownTimerWidget(durationSeconds: widget.exercise.durationSeconds),

                const SizedBox(width: 24),

                widget.exercise != controller.exercises.last ?
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.lotion,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    Get.to(ExercisePage(exercise: controller.exercises[widget.exercise.id+1]));
                  },
                  child: Transform.rotate(
                    angle: 180 * math.pi / 180,
                    child: SvgAssets.svgBack,
                  ),
                )
                : Container(width: 60,),

              ],
            ),


            //const SizedBox(height: 56),
            widget.exercise != controller.exercises.last
                ? ExerciseNextWidget()
                : Container(),

          ],
        ),
      ),
    );
  }
}
