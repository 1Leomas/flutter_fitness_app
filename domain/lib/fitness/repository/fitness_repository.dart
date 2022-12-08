import '../models/exercise.dart';
import '../models/goal.dart';

abstract class FitnessRepository {
  Future<List<Exercise>> getExercisesApi(int page, int limit);
  Future<List<Goal>> getGoalsApi();
}