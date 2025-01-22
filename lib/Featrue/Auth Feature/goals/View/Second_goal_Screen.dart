import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/third_goal_Screen.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';

class MotivationSelectionScreen extends StatefulWidget {
  @override
  _MotivationSelectionScreenState createState() => _MotivationSelectionScreenState();
}

class _MotivationSelectionScreenState extends State<MotivationSelectionScreen> {
  final List<Map<String, dynamic>> motivations = [
    {'text': 'Improving Health', 'icon': Icons.favorite},
    {'text': 'Boosting Immune System', 'icon': Icons.shield},
    {'text': 'Looking Better', 'icon': Icons.visibility},
    {'text': 'Building Strength and Endurance', 'icon': Icons.fitness_center},
    {'text': 'Boosting Libido', 'icon': Icons.heart_broken},
  ];

  List<String> selectedMotivations = [];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
              // child: ProgressIndicatorWidget(
              //   currentStep: 2,
              //   totalSteps: 10,
              // ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "What motivates you to exercise?",
              style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold,color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: motivations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {

                          if (selectedMotivations.contains(motivations[index]['text'])) {
                            selectedMotivations.remove(motivations[index]['text']);
                          } else {

                            selectedMotivations.add(motivations[index]['text']);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Icon(motivations[index]['icon'], color: Colors.white),
                                SizedBox(width: screenWidth * 0.03),
                                Text(
                                  motivations[index]['text'],
                                  style: TextStyle(fontSize: screenWidth * 0.043,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),

                            selectedMotivations.contains(motivations[index]['text'])
                                ? Icon(Icons.check_circle, color: Colors.white)
                                : Icon(Icons.circle_outlined, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: selectedMotivations.isEmpty
                  ? null
                  : () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BodySelectionScreen(),
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
    );
  }
}

class NextScreen extends StatelessWidget {
  final List<String> selectedGoals;
  final int currentStep;

  NextScreen({required this.selectedGoals, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Goals",
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
                ...selectedGoals.map((goal) => Text(
                  goal,
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
