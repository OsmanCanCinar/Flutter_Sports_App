import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'card_content.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColors.gradientFirst.withOpacity(0.8),
              color.AppColors.gradientSecond.withOpacity(0.9),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(80),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 7),
              blurRadius: 20,
              color: color.AppColors.gradientSecond.withOpacity(0.4),
            ),
          ]),
      child: const CardContent(),
    );
  }
}
