import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: color.AppColors.secondPageTopIconColor,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.info_outline,
          size: 20,
          color: color.AppColors.secondPageTopIconColor,
        ),
      ],
    );
  }
}
