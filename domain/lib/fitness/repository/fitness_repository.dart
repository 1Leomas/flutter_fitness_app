import '../models/exercise.dart';
import '../models/goal.dart';

abstract class FitnessRepository {
  Future<List<Exercise>> getExercisesApi();
  Future<List<Goal>> getGoalApi();
}