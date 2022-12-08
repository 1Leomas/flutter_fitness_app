import 'package:fitness_app_flutter/fitness/fitness_controller.dart';
import 'package:fitness_app_flutter/fitness/models/exercise_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../resources/custom_colors.dart';
import '../../resources/strings.dart';
import '../common/bottom_loading_indicator_item.dart';
import 'widgets/daily_exercise_widget/daily_exercise_widget.dart';
import 'widgets/goal_carousel_widget/goal_carousel_widget.dart';
import 'widgets/header_widget.dart';

class _FitnessPageState extends State<FitnessPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    //Get.lazyPut(() => HomeController());
    Get.put(FitnessController());
    FitnessController controller = Get.find();

    //controller.readJsonFile();

    controller.getExercises();
    controller.getGoals();

    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var currentScroll = scrollController.position.pixels;
      if (currentScroll >= maxScroll) {
        controller.getNextPage();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FitnessController controller = Get.find();

    final double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    //print("-------- ${controller.exercises.length}");

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark, // play with this
      child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20),
            color: CustomColors.cultured,
            //decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3),),

            child: CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[

                SliverToBoxAdapter(child: SizedBox(height: statusBarHeight),),

                const SliverToBoxAdapter(child: HeaderWidget(title: Strings.startNewGoal),),

                SliverToBoxAdapter(
                    child: GoalCarouselWidget(goals: controller.goals)
                ),

                const SliverToBoxAdapter(child: HeaderWidget(title: Strings.dailyTask),),

                Obx(() => SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int i) {

                        if(controller.exercisesList.isEmpty) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        var item = controller.exercisesList[i];
                        if (item is ExerciseListItem) {
                          return DailyExercise(exercise: item.exercise);
                        } else if (item is BottomLoadingIndicatorItem) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return Container();
                        }
                      },
                      childCount: controller.exercisesList.length//+100
                  ),
                )),



              ],
            ),
          )
      )

    );
  }
}

class FitnessPage extends StatefulWidget {
  const FitnessPage({super.key});

  @override
  State<FitnessPage> createState() => _FitnessPageState();

}