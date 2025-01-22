import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/TraingDays.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'injuries.dart';
class DietsPage extends StatefulWidget {
  @override
  _DietsPageState createState() => _DietsPageState();
}

class _DietsPageState extends State<DietsPage> {
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
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
              child:
              ProgressIndicatorWidget(
                currentStep: 3,
                totalSteps: 5,
                currentPage: 3 ,
                totalPages: 6,
                pagesPerStep: [5, 5, 5, 5, 5,5,5],
                width: screenWidth * 0.33,
              )
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                "Do you follow any of \n  these diets?",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                children: [
                  buildGoalOption(
                    context,
                    'No Dietary Restrictions',
                    'assets/images/problem_9000296-removebg-preview.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Vegetation',
                    'assets/images/carrot_2524601.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Vegan',
                    'assets/images/vegan_5579100.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'Keto',
                    'assets/images/avocado_4376702.png',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                      'Other',
                    'assets/images/other_6874038.png',
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

  Widget buildGoalOption(BuildContext context, String title, String imagePath, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = title;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseTrainingDays(),
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
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Image.asset(
                imagePath,
                color: selectedGoal == title ? Colors.blue : Colors.grey,
                width: screenWidth * 0.07,
                height: screenWidth * 0.06,
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
