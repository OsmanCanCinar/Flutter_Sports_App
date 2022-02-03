import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'package:sports_app/ui/detail_page.dart';

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
        InkWell(
          onTap: (){
            Get.to(() => DetailPage());
          },
          child: Icon(
            Icons.arrow_forward,
            size: 20,
            color: color.AppColors.homePageIcons,
          ),
        ),
      ],
    );
  }
}
