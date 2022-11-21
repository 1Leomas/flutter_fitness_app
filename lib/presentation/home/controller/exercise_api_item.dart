import '../../common/list_item.dart';

class ExerciseApiItem extends ListItem {
  final String title;
  final String image;
  final int duration;
  final int repetitions;
  final int burnCalories;
  final int plan;

  ExerciseApiItem({
    required this.title,
    required this.image,
    required this.duration,
    required this.repetitions,
    required this.burnCalories,
    required this.plan
  });
}