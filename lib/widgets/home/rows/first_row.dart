import 'package:sports_app/theme/app_colors.dart' as color;
import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Training',
          style: TextStyle(
            fontSize: 30,
            color: color.AppColors.homePageTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: color.AppColors.homePageIcons,
        ),
        const SizedBox(width: 10),
        Icon(
          Icons.calendar_today_outlined,
          size: 20,
          color: color.AppColors.homePageIcons,
        ),
        const SizedBox(width: 15),
        Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: color.AppColors.homePageIcons,
        ),
      ],
    );
  }
}
