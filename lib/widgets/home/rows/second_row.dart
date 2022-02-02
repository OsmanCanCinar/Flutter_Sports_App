import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class SecondRow extends StatelessWidget {
  const SecondRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Training',
          style: TextStyle(
            fontSize: 20,
            color: color.AppColors.homePageSubtitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            color: color.AppColors.homePageDetail,
          ),
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.arrow_forward,
          size: 20,
          color: color.AppColors.homePageIcons,
        ),
      ],
    );
  }
}
