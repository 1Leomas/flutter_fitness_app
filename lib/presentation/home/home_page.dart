import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../resources/custom_colors.dart';
import '../../resources/strings.dart';
import 'controller/home_controller.dart';
import 'widgets/daily_exercise_widget/daily_exercise.dart';
import 'widgets/daily_exercise_widget/daily_exercises_list.dart';
import 'widgets/goal_carousel_widget/goal_carousel_widget.dart';
import 'widgets/header_widget.dart';

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Get.lazyPut(() => HomeController());
    HomeController controller = Get.find();
    controller.readJsonFile();

    controller.getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    HomeController controller = Get.find();

    final double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark, // play with this
      child: Scaffold(
          body: Container(
            color: CustomColors.cultured,
            //decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3),),

            child: CustomScrollView(
              //center: centerKey,
              slivers: <Widget>[

                SliverToBoxAdapter(child: SizedBox(height: statusBarHeight),),

                const SliverToBoxAdapter(child: HeaderWidget(title: Strings.startNewGoal),),

                SliverFixedExtentList(
                  itemExtent: 281.0,
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Obx( () => controller.goalItems.isNotEmpty
                          ? GoalCarouselWidget(goals: controller.goalItems)
                          : const SizedBox(width: 30, height: 300, child: CircularProgressIndicator(),)
                      );
                    },
                    childCount: 1
                  ),
                ),

                const SliverToBoxAdapter(child: HeaderWidget(title: Strings.dailyTask),),

                SliverList(
                  //itemExtent: 370.0,
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int i) {
                        if(controller.exerciseItems.isNotEmpty) {
                          var exercise = controller.exerciseItems[i];
                          return Obx( () => Column(
                            children: [
                              DailyExercise(exercise: controller.exerciseItems[i]),
                              const SizedBox(height: 12),
                            ],
                          ));
                        } else {
                          return const SizedBox(width: 30, height: 300, child: CircularProgressIndicator(),);
                        }
                      },
                      childCount: controller.exerciseItems.isNotEmpty ? controller.exerciseItems.length : 1
                  ),
                ),


                /*SizedBox(height: statusBarHeight),

                const HeaderWidget(title: Strings.startNewGoal),

                Obx( () => controller.goalItems.isNotEmpty
                    ? GoalCarouselWidget(goals: controller.goalItems)
                    : const SizedBox(width: 30, height: 300,
                        child: CircularProgressIndicator(),
                      )
                ),*/

                /*const HeaderWidget(title: Strings.dailyTask),

                Obx( () => controller.exerciseItems.isNotEmpty
                    ? DailyExercisesList(exercises: controller.exerciseItems)
                    : const SizedBox(width: 30, height: 300,
                        child: CircularProgressIndicator(),
                      )
                ),*/

              ],
            ),
          )
      )

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}
