import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColors.gradientFirst.withOpacity(0.9),
              color.AppColors.gradientSecond.withOpacity(0.9),
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: color.AppColors.secondPageTopIconColor,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: color.AppColors.secondPageTopIconColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
