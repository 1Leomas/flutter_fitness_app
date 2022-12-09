import 'package:flutter/material.dart';

import '../../../resources/images_assets.dart';

class DailyExerciseImage extends StatelessWidget {
  const DailyExerciseImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48, //48
      width: 48,  //48
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: FittedBox(
          fit: BoxFit.fill,
          child: ImagesAssets.exerciseImage,
          // child: Image.network(
          //   image,
          //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          //     return Image.asset('resources/images/not_found_icon.png');
          //   },
          //   loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
          //     if (loadingProgress == null) return child;
          //     return Center(child: Text("IMAGE"),);
          //   },
          // ),
        )
      ),
    );
  }
}
