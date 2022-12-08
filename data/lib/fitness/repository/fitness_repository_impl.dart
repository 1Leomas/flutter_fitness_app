import 'package:data/fitness/mappers/exercise_mapper.dart';
import 'package:data/fitness/mappers/goal_mapper.dart';
import 'package:domain/fitness/models/exercise.dart';
import 'package:domain/fitness/models/goal.dart';
import 'package:domain/fitness/repository/fitness_repository.dart';

import '../data_sources/api/fitness_api_data_source.dart';

class FitnessRepositoryImpl implements FitnessRepository {

  final FitnessApiDataSource fitnessApiDataSource;

  FitnessRepositoryImpl(this.fitnessApiDataSource);

  @override
  Future<List<Exercise>> getExercisesApi(int page, int limit) async {
    var exercises = await fitnessApiDataSource.getExercises(page, limit);
    return exercises.map((e) => ExerciseMapper().mapApiDtoToModel(e)).toList();
  }

  @override
  Future<List<Goal>> getGoalsApi() async {
    var goals = await fitnessApiDataSource.getGoals();
    return goals.map((e) => GoalMapper().mapApiDtoToModel(e)).toList();
  }

}