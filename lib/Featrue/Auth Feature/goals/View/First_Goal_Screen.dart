import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/sensitive.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'Second_goal_Screen.dart';

class MainGoalPage extends StatefulWidget {
  @override
  _MainGoalPageState createState() => _MainGoalPageState();
}

class _MainGoalPageState extends State<MainGoalPage> {
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
                currentStep: 2,
                totalSteps: 5,
                currentPage: 2, // الصفحة الحالية داخل الخطوة
                totalPages: 6, // إجمالي صفحات الخطوة الحالية
                pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
                width: screenWidth * 0.33,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),


            Text(
              "What’s your main goal?",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),


            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Row(
                children: [
                  Icon(Icons.adjust, color: Colors.red, size: screenWidth * 0.07),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Text(
                      "We’ll tailor the best blend of strength and cardio training to align with your goal.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),


            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                children: [
                  buildGoalOption(
                    context,
                    'assets/images/goal1.png',
                    'Reduce fat percentage',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'assets/images/goal2.png',
                    'Increase muscle mass',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'assets/images/gaol3.png',
                    'Get the perfect body',
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
            builder: (context) => SensitivePage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: selectedGoal == title ? Colors.blue : Colors.transparent,
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
                width: screenWidth * 0.25,
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


