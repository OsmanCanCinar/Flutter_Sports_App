import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'package:sports_app/widgets/detail/upper/tag_widget.dart';
import 'package:sports_app/widgets/detail/upper/top_row.dart';

class UpperPage extends StatelessWidget {
  const UpperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopRow(),
          const SizedBox(height: 30),
          Text(
            'Leg Toning and\nglutes workout for\nbeginners',
            style: TextStyle(
                fontSize: 25, color: color.AppColors.secondPageTitleColor),
          ),
          const SizedBox(height: 40),
          Row(
            children: const [
              TagWidget(text: 'Weight Lifting'),
              SizedBox(width: 15),
              TagWidget(text: 'CrossFit Wod'),
            ],
          ),
        ],
      ),
    );
  }
}
