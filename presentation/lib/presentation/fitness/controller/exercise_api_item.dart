import '../../common/list_item.dart';

class ExerciseApiItem extends ListItem {
  final String title;
  final String cover;
  final int durationSeconds;
  final int repetitions;
  final int caloriesCount;
  final int plan;

  ExerciseApiItem({
    required this.title,
    required this.cover,
    required this.durationSeconds,
    required this.repetitions,
    required this.caloriesCount,
    required this.plan
  });
}