import 'package:flutter/material.dart';

import '../../../../resources/custom_colors.dart';
import '../../../../resources/text_styles.dart';

class GoalTitleDescriptionWidget extends StatelessWidget {
  const GoalTitleDescriptionWidget({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {

    //var finaldescription

    return Container(
      margin: const EdgeInsets.only(left: 12.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.poppins24(),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.poppins14(color: CustomColors.spanishGray, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
