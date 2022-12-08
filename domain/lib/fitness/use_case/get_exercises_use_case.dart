import 'package:domain/fitness/common/use_case.dart';
import 'package:domain/fitness/models/exercise.dart';
import 'package:domain/fitness/repository/fitness_repository.dart';

class GetExercisesUseCase implements UseCase<Future<List<Exercise>>, GetExercisesParams>{
  final FitnessRepository repository;

  GetExercisesUseCase(this.repository);
  
  Future<List<Exercise>> call(GetExercisesParams params) async {
    //repository.getExercises().then((value) => null);
    return repository.getExercisesApi(params.page, params.limit);
  }
}

class GetExercisesParams {
  int page;
  int limit;

  GetExercisesParams(this.page, this.limit);
}