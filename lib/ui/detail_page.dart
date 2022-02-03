import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'package:sports_app/widgets/detail/lower/lower_page.dart';
import 'package:sports_app/widgets/detail/upper/uppder_page.dart';

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
          children: const [
            UpperPage(),
            LowerPage(),
          ],
        ),
      ),
    );
  }
}
