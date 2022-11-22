import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../resources/custom_colors.dart';
import '../../resources/strings.dart';
import 'controller/home_controller.dart';
import 'widgets/daily_exercise_widget/daily_exercise.dart';
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark, // play with this
      child: Scaffold(
          body: Container(
            color: CustomColors.cultured,
            //decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3),),

            child: CustomScrollView(
              slivers: <Widget>[

                SliverToBoxAdapter(child: SizedBox(height: statusBarHeight),),

                const SliverToBoxAdapter(child: HeaderWidget(title: Strings.startNewGoal),),

                SliverToBoxAdapter(
                    child: GoalCarouselWidget(goals: controller.goalItems)
                ),

                const SliverToBoxAdapter(child: HeaderWidget(title: Strings.dailyTask),),

                Obx(() => SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int i) {
                        var item = controller.exerciseApiItem[i];
                        //var item = controller.exerciseItems[i];
                        return Column(
                          children: [
                            controller.exerciseApiItem.isNotEmpty
                                ? DailyExercise(exercise: item)
                                : const Center( child: CircularProgressIndicator()),
                            const SizedBox(height: 12),
                          ],
                        );
                      },
                      childCount: controller.exerciseApiItem.length
                  ),
                ))
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
