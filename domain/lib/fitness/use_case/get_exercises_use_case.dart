import 'package:domain/fitness/models/exercise.dart';
import 'package:domain/fitness/repository/fitness_repository.dart';

class GetExercisesUseCase {
  final FitnessRepository repository;

  GetExercisesUseCase(this.repository);
  
  Future<List<Exercise>> call() async {
    //repository.getExercises().then((value) => null);
    return repository.getExercisesApi();
  }
}