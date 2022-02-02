import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class MotivationText extends StatelessWidget {
  const MotivationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You are doing great',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color.AppColors.homePageDetail,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: 'Keep it up,\nstick to your plan!',
            style: TextStyle(
              color: color.AppColors.homePagePlanColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
