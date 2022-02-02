import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.info,
    required this.index,
  }) : super(key: key);

  final List info;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width- 80)/2,
      height: 140,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 15),
      padding: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(info[index]['img']),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: const Offset(5, 5),
            color: color.AppColors.gradientSecond.withOpacity(0.1),
          ),
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(-3, -3),
            color: color.AppColors.gradientSecond.withOpacity(0.1),
          ),
        ],
      ),
      child: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            info[index]['title'],
            style: TextStyle(
              fontSize: 20,
              color: color.AppColors.homePageDetail,
            ),
          ),
        ),
      ),
    );
  }
}
