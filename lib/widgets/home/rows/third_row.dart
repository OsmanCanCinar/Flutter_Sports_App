import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class ThirdRow extends StatelessWidget {
  const ThirdRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Area of Focus',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: color.AppColors.homePageTitle,
          ),
        ),
      ],
    );
  }
}
