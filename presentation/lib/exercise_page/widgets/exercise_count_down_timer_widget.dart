import 'package:fitness_app_flutter/resources/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/custom_colors.dart';
import '../exercise_controller.dart';


class ExerciseCountDownTimerWidget extends StatefulWidget {
  const ExerciseCountDownTimerWidget({Key? key}) : super(key: key);

  @override
  State<ExerciseCountDownTimerWidget> createState() => _ExerciseCountDownTimerWidgetState();
}

class _ExerciseCountDownTimerWidgetState extends State<ExerciseCountDownTimerWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ExerciseController controller = Get.find();

    return Container(
      height: 166,
      width: 166,
      //decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1),),
      child: Obx(() {

        return Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: controller.duration.value.inMilliseconds / controller.totalDuration.inMilliseconds,
            backgroundColor: CustomColors.cultured,
            color: CustomColors.cyanCornflowerBlue,
            strokeWidth: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.cyanCornflowerBlue,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: const CircleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    onPressed: () {
                      if (controller.countDownIsRunning.isFalse) {
                        controller.startTimer(restart: false);
                      } else {
                        controller.pauseTimer();
                      }

                      controller.changeButtonState();
                    },
                    child: (controller.countDownIsRunning.isTrue) ? SvgAssets.iconPause : SvgAssets.iconPlayWhite
                ),
              )
            ],
          )
        ],
      );
      })
    );
  }
}
