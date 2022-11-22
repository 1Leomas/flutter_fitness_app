import 'package:flutter/material.dart';

class DailyExerciseImage extends StatelessWidget {
  const DailyExerciseImage({Key? key, required this.cover}) : super(key: key);

  final String cover;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48, //48
      width: 48,  //48
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          cover,
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset('resources/images/not_found_icon.png');
          },
        ),
      ),
    );
  }
}
