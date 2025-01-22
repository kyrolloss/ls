import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/injuries.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';

class SensitivePage extends StatefulWidget {
  @override
  _SensitivePageState createState() => _SensitivePageState();
}

class _SensitivePageState extends State<SensitivePage> {
  List<String> selectedGoals = [];
  TextEditingController otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: ProgressIndicatorWidget(
                  currentStep: 2,
                  totalSteps: 5,
                  currentPage: 3,
                  totalPages: 6,
                  pagesPerStep: [5, 5, 5, 5, 5,5,5],
                  width: screenWidth * 0.33,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              Center(
                child: Text(
                  "Are you allergic to \nthose substances?",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
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

              ListView(
                shrinkWrap: true, // Important to avoid infinite height
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                children: [
                  buildGoalOption(
                    context,
                    'assets/images/fish.png',
                    'Fish',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'assets/images/lambus.jpg',
                    'Legumes',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'assets/images/Egg.png',
                    'Egg',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  buildGoalOption(
                    context,
                    'assets/images/OtherFood.png',
                    'Other',
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // TextField for "Other" option
                  Visibility(
                    visible: selectedGoals.contains('Other'),
                    child: TextField(
                      controller: otherController,
                      decoration: InputDecoration(
                        labelText: "Please specify",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: ElevatedButton(
                  onPressed: selectedGoals.isNotEmpty
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InjuriesRecently(),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02, horizontal: screenWidth * 0.09),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                    backgroundColor: selectedGoals.isNotEmpty
                        ? Colors.black
                        : Colors.grey.shade400,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGoalOption(BuildContext context, String imagePath, String title,
      double screenWidth, double screenHeight) {
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
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
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

