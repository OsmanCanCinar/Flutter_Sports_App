import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'motivation_text.dart';

class MotivationCard extends StatelessWidget {
  const MotivationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 37),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/card.jpg',
                ),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  offset: const Offset(8, 10),
                  color: color.AppColors.gradientSecond.withOpacity(0.3),
                ),
                BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(-1, -5),
                  color: color.AppColors.gradientSecond.withOpacity(0.3),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 30, right: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/figure.png'),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 90,
            margin: const EdgeInsets.fromLTRB(150, 50, 15, 0),
            child: const MotivationText(),
          ),
        ],
      ),
    );
  }
}
