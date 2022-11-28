import 'package:domain/fitness/repository/fitness_repository.dart';

import '../models/goal.dart';

class GetGoalsUseCase {
  final FitnessRepository repository;

  GetGoalsUseCase(this.repository);

  Future<List<Goal>> call() async {
    return repository.getGoalsApi();
  }
}