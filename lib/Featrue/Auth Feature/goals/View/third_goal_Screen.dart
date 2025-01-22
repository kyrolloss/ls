import 'package:flutter/material.dart';

import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'gender.dart';

class BodySelectionScreen extends StatefulWidget {
  @override
  _BodySelectionScreenState createState() => _BodySelectionScreenState();
}

class _BodySelectionScreenState extends State<BodySelectionScreen> {
  final List<String> selectedBodyAreas = [];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Selection.png', // Use the correct path for your image
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
            child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Progress Indicator
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                    // child: ProgressIndicatorWidget(
                    //   currentStep: 3,
                    //   totalSteps: 10,
                    // ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Main Heading
                  Text(
                    "Which areas do you want to focus on?",
                    style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Select the target area for more accurate course recommendations",
                    style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Body Areas Selection
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the right side
                    children: [
                      Align(
                        alignment: Alignment.centerRight, // Align all the text buttons to the right
                        child: bodyAreaButton("Back", screenWidth, screenHeight),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: bodyAreaButton("Chest", screenWidth, screenHeight),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: bodyAreaButton("Arms", screenWidth, screenHeight),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: bodyAreaButton("Abs", screenWidth, screenHeight),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: bodyAreaButton("Butt", screenWidth, screenHeight),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: bodyAreaButton("Legs", screenWidth, screenHeight),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: bodyAreaButton("Whole Body", screenWidth, screenHeight),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Continue Button
                  ElevatedButton(
                    onPressed: selectedBodyAreas.isEmpty
                        ? null
                        : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Gender()
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.3),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Button widget for each body area
  Widget bodyAreaButton(String area, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (selectedBodyAreas.contains(area)) {
              selectedBodyAreas.remove(area);
            } else {
              selectedBodyAreas.add(area);
            }
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.06),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: selectedBodyAreas.contains(area) ? Colors.white : Colors.transparent,
          ),
          child: Text(
            area,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: selectedBodyAreas.contains(area) ? Colors.black : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final List<String> selectedBodyAreas;
  final int currentStep;

  NextScreen({required this.selectedBodyAreas, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Selected Body Areas",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: Container(
                    width: screenWidth * 0.12,
                    height: 5,
                    color: index < currentStep ? Colors.yellow : Colors.grey.shade300,
                  ),
                );
              }),
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "You have selected:",
                  style: TextStyle(fontSize: screenWidth * 0.06),
                ),
                SizedBox(height: 10),
                ...selectedBodyAreas.map((area) => Text(
                  area,
                  style: TextStyle(fontSize: screenWidth * 0.05),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
