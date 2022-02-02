import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'package:sports_app/widgets/home/body/body_parts.dart';
import 'package:sports_app/widgets/home/motivation_card/motivation_card.dart';
import 'package:sports_app/widgets/home/rows/third_row.dart';
import 'package:sports_app/widgets/home/workout_card/workout_card.dart';
import 'package:sports_app/widgets/home/rows/first_row.dart';
import 'package:sports_app/widgets/home/rows/second_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.homePageBackground,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
          child: Column(
            children: const [
              FirstRow(),
              SizedBox(height: 15),
              SecondRow(),
              SizedBox(height: 15),
              WorkoutCard(),
              MotivationCard(),
              ThirdRow(),
              SizedBox(height: 10),
              BodyParts(),
            ],
          ),
        ),
      ),
    );
  }
}
