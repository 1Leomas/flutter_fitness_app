import 'package:fitness_app_flutter/resources/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../resources/custom_colors.dart';
import '../../resources/text_styles.dart';
import '../exercise_controller.dart';


class ExerciseCountDownTimerWidget extends StatefulWidget {
  const ExerciseCountDownTimerWidget({Key? key, required this.durationSeconds}) : super(key: key);

  final int durationSeconds;

  @override
  State<ExerciseCountDownTimerWidget> createState() => _ExerciseCountDownTimerWidgetState();
}

class _ExerciseCountDownTimerWidgetState extends State<ExerciseCountDownTimerWidget> {

  @override
  void initState() {
    ExerciseController controller = Get.find();

    controller.startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ExerciseController controller = Get.find();

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    double time = (widget.durationSeconds > 0) ? (widget.durationSeconds/60).ceilToDouble() : 1;

    return Container(
      height: 166,
      width: 166,
      //decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1),),
      child: Obx(() {

        controller.sHours.value = twoDigits(controller.duration.value.inHours.remainder(60));
        controller.sMinutes.value = twoDigits(controller.duration.value.inMinutes.remainder(60));
        controller.sSeconds.value = twoDigits(controller.duration.value.inSeconds.remainder(60));

        return Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: controller.duration.value.inMilliseconds / controller.totalDuration.inMilliseconds,
            backgroundColor: CustomColors.cultured,
            color: CustomColors.cyanCornflowerBlue,
            strokeWidth: 12,
          ),
          Center(
            child: Text(
              "${controller.sMinutes}:${controller.sSeconds}",
              style: TextStyles.poppins52(),
            ),
          ),
        ],
      );
      })
    );
  }
}
