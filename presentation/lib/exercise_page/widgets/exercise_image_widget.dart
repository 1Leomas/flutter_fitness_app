import 'package:flutter/material.dart';

import '../../resources/images_assets.dart';

class ExerciseImageWidget extends StatelessWidget {
  const ExerciseImageWidget({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272,
      width: 358,
      //decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3),),
      child: FittedBox(
        fit: BoxFit.fill,
        child: ImagesAssets.exerciseImagePlaceHolder,
        // child: Image.network(
        //   image,
        //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        //     //return Image.asset('resources/images/not_found_icon.png');
        //     return const Icon(Icons.error);
        //   },
        // ),
      ),
    );
  }
}
