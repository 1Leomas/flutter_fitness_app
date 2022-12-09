import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../fitness/fitness_controller.dart';
import '../../fitness/fitness_page.dart';
import '../../resources/custom_colors.dart';
import '../../resources/svg_assets.dart';
import '../../resources/text_styles.dart';

class ExerciseHeaderWidget extends StatelessWidget {
  const ExerciseHeaderWidget({Key? key, required this.index}) : super(key: key);

  final int index;



  @override
  Widget build(BuildContext context) {

    FitnessController controller = Get.find();

    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          margin: const EdgeInsets.only(left: 16),
          //decoration: BoxDecoration(border: Border.all(color: Colors.deepOrange, width: 1),),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.white,
                elevation: 0.0,
                shadowColor: Colors.transparent,
                shape: const CircleBorder(
                  side: BorderSide(color: CustomColors.brightGray),
                ),
              ),
              onPressed: () {
                Get.off(const FitnessPage());
              },
              child: SvgAssets.svgBack
          ),
        ),

        Container(
          padding: const EdgeInsets.only(left: 81),
          //decoration: BoxDecoration(border: Border.all(color: Colors.brown, width: 1),),
          child: Center(
            child: Text(
              "Exercise $index/${controller.exercisesList.length}",
              style: TextStyles.poppins16(),
            ),
          ),
        )

      ],
    );
  }
}
