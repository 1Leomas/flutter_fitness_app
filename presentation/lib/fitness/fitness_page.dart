import 'package:fitness_app_flutter/fitness/fitness_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../resources/custom_colors.dart';
import '../../resources/strings.dart';
import 'widgets/daily_exercise_widget/daily_exercise_widget.dart';
import 'widgets/goal_carousel_widget/goal_carousel_widget.dart';
import 'widgets/header_widget.dart';

class _FitnessPageState extends State<FitnessPage> {

  @override
  void initState() {
    //Get.lazyPut(() => HomeController());
    Get.put(FitnessController());
    FitnessController controller = Get.find();

    //controller.readJsonFile();

    controller.getExercises();
    controller.getGoals();

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

                        if(controller.exercises.isNotEmpty) {
                          //var item = controller.exerciseApiItem[i];
                          var exercise = controller.exercises[i];
                          return DailyExercise(exercise: exercise);
                        }

                        else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                      childCount: controller.exercises.length//+100
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