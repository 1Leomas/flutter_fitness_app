import 'package:flutter/material.dart';

import '../../resources/images_assets.dart';

class ExerciseImageWidget extends StatelessWidget {
  const ExerciseImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272,
      decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3),),
      child: ImagesAssets.exerciseImagePlaceHolder,
    );
  }
}
