import 'package:domain/fitness/models/exercise.dart';
import 'package:domain/fitness/models/goal.dart';
import 'package:domain/fitness/use_case/get_exercises_use_case.dart';
import 'package:domain/fitness/use_case/get_goals_use_case.dart';
import 'package:fitness_app_flutter/fitness/models/exercise_list_item.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../common/bottom_loading_indicator_item.dart';
import '../common/list_item.dart';

class FitnessController extends GetxController{
  RxList<ListItem> exercisesList = RxList();
  RxList<Goal> goals = RxList();

  int page = 1;
  int limit = 20;
  bool canGetMoreData = false;

  var getExercisesUseCase = GetIt.instance.get<GetExercisesUseCase>();
  var getGoalsUseCase = GetIt.instance.get<GetGoalsUseCase>();

  void getExercises() async {

      if(page !=1) await Future.delayed(const Duration(seconds: 3));

      getExercisesUseCase.call(GetExercisesParams(page, limit)).then((exercises) {

      //print('----------exercises length: ${exercises.length} ---------');

      exercisesList.removeWhere((element) => element is BottomLoadingIndicatorItem);

      int i = 0;
      exercisesList.addAll(exercises.map((e) {
        Exercise ex = Exercise(i, e.title, e.image, e.durationSeconds, e.repetitions, e.burnCalories, e.plan, e.nextExercise);
        i++;
        return ExerciseListItem(ex);
      }).toList());
      
      exercisesList.add(BottomLoadingIndicatorItem());

      page++;

      canGetMoreData = true;

    });
  }

  void getGoals() {
    getGoalsUseCase.call().then((goalsList) {
      //print('----------goalsList length: ${goalsList.length} ---------');
      goals.value = goalsList;
    });
  }

  void getNextPage() {
    if (canGetMoreData) {
      //print("Can get next page");
      canGetMoreData = false;
      getExercises();
    }
  }
}


















