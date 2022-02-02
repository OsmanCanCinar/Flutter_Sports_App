import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class CardContent extends StatelessWidget {
  const CardContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Workout',
            style: TextStyle(
                fontSize: 16,
                color: color.AppColors.homePageContainerTextSmall),
          ),
          const SizedBox(height: 5),
          Text(
            'Leg Toning and\nglutes workout for\nbeginners',
            style: TextStyle(
                fontSize: 25,
                color: color.AppColors.homePageContainerTextSmall),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 25,
                    color: color.AppColors.homePageIconsLight,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '60 min',
                    style: TextStyle(
                        fontSize: 16,
                        color: color.AppColors.homePageContainerTextSmall),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: color.AppColors.gradientFirst,
                      blurRadius: 10,
                      offset: const Offset(4, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
