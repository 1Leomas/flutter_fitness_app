import '../../entities/api/exercise_api_dto.dart';
import '../../entities/api/goal_api_dto.dart';

abstract class FitnessJsonDataSource {
  Future<List<ExerciseApiDto>> getExercises();
  Future<List<GoalApiDto>> getGoals();
}

class FitnessJsonDataSourceImpl implements FitnessJsonDataSource {
  @override
  Future<List<ExerciseApiDto>> getExercises() async {

    /*String jsonString = await rootBundle.loadString(Files.jsonFitnessFilePath);
    var map = jsonDecode(jsonString);*/

    // TODO: implement getGoals
    throw UnimplementedError();

  }

  @override
  Future<List<GoalApiDto>> getGoals() {
    // TODO: implement getGoals
    throw UnimplementedError();
  }

}