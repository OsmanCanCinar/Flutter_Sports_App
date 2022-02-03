import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class RowOne extends StatelessWidget {
  const RowOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Circuit 1: Legs Toning',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color.AppColors.circuitsColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.loop,
              size: 30,
              color: color.AppColors.loopColor,
            ),
            Text(
              '3 sets',
              style: TextStyle(
                fontSize: 15,
                color: color.AppColors.setsColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
