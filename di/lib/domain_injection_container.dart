import 'package:domain/fitness/repository/fitness_repository.dart';
import 'package:domain/fitness/use_case/get_exercises_use_case.dart';
import 'package:domain/fitness/use_case/get_goals_use_case.dart';
import 'package:get_it/get_it.dart';

Future initDomain() async {
  var getIt = GetIt.instance;

  getIt.registerLazySingleton<GetExercisesUseCase>(() => GetExercisesUseCase(getIt.get<FitnessRepository>()));

  getIt.registerLazySingleton<GetGoalsUseCase>(() => GetGoalsUseCase(getIt.get<FitnessRepository>()));
}