import 'package:fitness_app_flutter/presentation/home/controller/goal_item.dart';
import 'package:flutter/material.dart';

import 'goal_card_widget.dart';

class GoalCarouselWidget extends StatefulWidget {
  const GoalCarouselWidget({super.key, required this.goals});

  final List<GoalItem> goals;

  @override
  State<GoalCarouselWidget> createState() => _GoalCarouselWidgetState();
}

class _GoalCarouselWidgetState extends State<GoalCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 310,
      height: 281, //280 //325
      margin: const EdgeInsets.only(top: 0),
      //decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent),),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: PageController(viewportFraction: 0.85), //85
              padEnds: false,
              itemCount: widget.goals.length,
              itemBuilder: (_, i) {
                var goal = widget.goals[i];
                return GoalCardWidget(goal: goal);
              },
            ),
          ),
        ],
      ),
    );
  }
}
