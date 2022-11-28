import 'package:data/fitness/entities/api/goal_api_dto.dart';
import 'package:domain/fitness/models/goal.dart';

class GoalMapper {
  Goal mapApiDtoToModel(GoalApiDto input) {
    return Goal(input.id, input.image, input.title, input.description, input.durationSeconds, input.burnCalories);
  }
}