import 'package:fitness_app_flutter/exercise_page/exercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/custom_colors.dart';
import '../../resources/text_styles.dart';

class ExerciseTitleWidget extends StatefulWidget {
  const ExerciseTitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ExerciseTitleWidget> createState() => _ExerciseTitleWidgetState();
}

class _ExerciseTitleWidgetState extends State<ExerciseTitleWidget> {
  @override
  Widget build(BuildContext context) {

    ExerciseController controller = Get.find();

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    return Column(
      children: [
        Obx(() => controller.countDownIsRunning.isFalse
            ? Text( "Ready to go",  style: TextStyles.poppins28())
            : Text( widget.title, style: TextStyles.poppins28(color: CustomColors.maastrichtBlue)),
        ),


        const SizedBox(height: 16),

        Obx(() {

          if (controller.countDownIsRunning.isFalse) {
            return Text( widget.title, style: TextStyles.poppins18());
          } else {

            controller.sHours.value = twoDigits(controller.duration.value.inHours.remainder(60));
            controller.sMinutes.value = twoDigits(controller.duration.value.inMinutes.remainder(60));
            controller.sSeconds.value = twoDigits(controller.duration.value.inSeconds.remainder(60));

            return Text( "${controller.sMinutes}:${controller.sSeconds}",
              style: TextStyles.poppins18(color: CustomColors.cyanCornflowerBlue),
            );
          }
        })

      ],
    );
  }
}
