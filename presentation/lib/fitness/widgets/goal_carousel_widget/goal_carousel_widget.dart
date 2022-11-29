import 'package:domain/fitness/models/goal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'goal_card_widget.dart';

class GoalCarouselWidget extends StatefulWidget {
  const GoalCarouselWidget({super.key, required this.goals});

  final RxList<Goal> goals;

  @override
  State<GoalCarouselWidget> createState() => _GoalCarouselWidgetState();
}

class _GoalCarouselWidgetState extends State<GoalCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 281,
      child: Column( children: [
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: PageController(viewportFraction: 0.85), //85
            padEnds: false,
            itemCount: widget.goals.length,
            itemBuilder: (_, i) => widget.goals.isNotEmpty
                ? GoalCardWidget(goal: widget.goals[i])
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],),
    ));
  }
}
