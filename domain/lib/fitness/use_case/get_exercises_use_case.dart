import 'package:domain/fitness/models/exercise.dart';
import 'package:domain/fitness/repository/fitness_repository.dart';

class GetExercisesUseCase {
  final FitnessRepository repository;

  GetExercisesUseCase(this.repository);
  
  Stream<List<Exercise>> call() async* {
    //repository.getExercises().then((value) => null);
    //yield* repository.getExercises();
  }
}