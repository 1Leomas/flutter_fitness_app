import '../models/exercise.dart';
import '../models/goal.dart';

abstract class FitnessRepository {
  Future<List<Exercise>> getExercises();
  Future<List<Goal>> getGoal();
}