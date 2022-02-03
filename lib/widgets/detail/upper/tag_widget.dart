import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class TagWidget extends StatelessWidget {
  const TagWidget({
    this.text,
    Key? key,
  }) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            color.AppColors.secondPageContainerGradient1stColor,
            color.AppColors.secondPageContainerGradient2ndColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.sports,
            size: 20,
            color: color.AppColors.secondPageTopIconColor,
          ),

          Text(
            text,
            style: TextStyle(
                fontSize: 16, color: color.AppColors.secondPageIconColor),
          ),
        ],
      ),
    );
  }
}
