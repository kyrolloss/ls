import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/End.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/FitnessEquipment.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/TrainingKind.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'Rate.dart';

class ChooseTrainingBreak extends StatefulWidget {
  @override
  _ChooseTrainingBreakState createState() => _ChooseTrainingBreakState();
}

class _ChooseTrainingBreakState extends State<ChooseTrainingBreak> {
  List<String> selectedGoals = [];

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
                  currentStep: 5,
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
                "Choose Your Training Break ?",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: screenHeight * 0.03,
                  crossAxisSpacing: screenWidth * 0.05,
                  childAspectRatio: 0.9,
                ),
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  return buildGoalOption(
                    context,
                    goal['title']!,
                    screenWidth,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: ElevatedButton(
                onPressed: selectedGoals.isNotEmpty
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThankYouPage(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGoals.isNotEmpty
                      ? Colors.black
                      : Colors.grey,
                  padding:
                  EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: selectedGoals.isNotEmpty
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18,
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

  Widget buildGoalOption(
      BuildContext context, String title, double screenWidth) {
    bool isSelected = selectedGoals.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedGoals.remove(title);
          } else {
            selectedGoals.add(title);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: screenWidth * 0.005,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> goals = [
  {'title': 'Sunday', },
  {'title': 'Saturday', },
  {'title': 'Monday', },
  {'title': 'Tuesday', },
  {'title': 'Wednesday', },
  {'title': 'Thursday', },
  {'title': 'Friday', },
];
