import 'package:data/fitness/entities/api/exercise_api_dto.dart';
import 'package:domain/fitness/models/exercise.dart';

class ExerciseMapper {
  Exercise mapApiDtoToModel(ExerciseApiDto input) {
    return Exercise(input.id, input.title, input.image, input.durationSeconds, input.repetitions, input.burnCalories, input.plan, input.nextExercise);
  }
}