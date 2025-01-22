import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/AboutUs.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/CurnnetBody.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/TrainingWays.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'End.dart';


class TrainingLocation extends StatefulWidget {

  @override
  _TrainingLocationState createState() => _TrainingLocationState();
}

class _TrainingLocationState extends State<TrainingLocation> {
  String selectedGoal = '';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                child:
                ProgressIndicatorWidget(
                  currentStep: 4,
                  totalSteps: 5,
                  currentPage: 4 ,
                  totalPages: 6,
                  pagesPerStep: [5, 5, 5, 5, 5,5,5],
                  width: screenWidth * 0.33,
                )
            ),
            SizedBox(height: screenHeight * 0.03),


            Text(
              "Where do you train?",
              style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                children: [
                  buildGoalOption(
                    context,
                    'assets/images/beginner.jpg',
                    'Home',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'assets/images/equimpent.png',
                    'Small Gym',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'assets/images/GymEquipment.png',
                    'Big Gym',
                    screenWidth,
                    screenHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildGoalOption(BuildContext context, String imagePath, String title, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = title;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HearingAboutUs(),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: selectedGoal == title ? Colors.black : Colors.transparent,
            width: screenWidth * 0.005,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(screenWidth * 0.03),
                bottomRight: Radius.circular(screenWidth * 0.03),
              ),
              child: Image.asset(
                imagePath,
                width: screenWidth * 0.30,
                height: screenWidth * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


