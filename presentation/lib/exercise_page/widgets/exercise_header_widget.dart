import 'package:flutter/material.dart';

import '../../resources/custom_colors.dart';
import '../../resources/svg_assets.dart';
import '../../resources/text_styles.dart';

class ExerciseHeaderWidget extends StatelessWidget {
  const ExerciseHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              child: SvgAssets.svgBack
          ),
        ),

        Container(
          padding: const EdgeInsets.only(left: 81),
          //decoration: BoxDecoration(border: Border.all(color: Colors.brown, width: 1),),
          child: Center(
            child: Text(
              "Exercise 1/10",
              style: TextStyles.poppins16(),
            ),
          ),
        )

      ],
    );
  }
}