import 'package:domain/fitness/models/exercise.dart';
import 'package:domain/fitness/models/goal.dart';
import 'package:domain/fitness/use_case/get_exercises_use_case.dart';
import 'package:domain/fitness/use_case/get_goals_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';



class FitnessController extends GetxController{
  RxList<Exercise> exercises = RxList();
  RxList<Goal> goals = RxList();

  var getExercisesUseCase = GetIt.instance.get<GetExercisesUseCase>();
  var getGoalsUseCase = GetIt.instance.get<GetGoalsUseCase>();

  void getExercises() {
    getExercisesUseCase.call().then((exercisesList) {
      print('----------exercisesList length: ${exercisesList.length} ---------');
      exercises.value = exercisesList;
    });
  }

  void getGoals() {
    getGoalsUseCase.call().then((goalsList) {
      print('----------goalsList length: ${goalsList.length} ---------');
      goals.value = goalsList;
    });
  }
}


















