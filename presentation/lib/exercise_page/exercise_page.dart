import 'package:fitness_app_flutter/exercise_page/widgets/exercise_header_widget.dart';
import 'package:fitness_app_flutter/resources/custom_colors.dart';
import 'package:fitness_app_flutter/resources/images_assets.dart';
import 'package:flutter/material.dart';

import '../resources/svg_assets.dart';
import '../resources/text_styles.dart';
import 'widgets/exercise_image_widget.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3),),
        child: Column(
          children: [
            const SizedBox(height: 48),

            const ExerciseHeaderWidget(),

            const SizedBox(height: 32),

            const ExerciseImageWidget(),

            const SizedBox(height: 32),

            Column(
              children: const [
                Text(
                  "Ready to go",
                  //style: ,
                ),
                Text(
                    "Back Push-Ups"
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
