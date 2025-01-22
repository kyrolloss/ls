import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/BreakThree.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';

class DiseasesScreen extends StatefulWidget {
  @override
  _DiseasesScreenState createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  List<String> selectedGoals = [];
  String otherText = ""; // لتخزين النص المدخل

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
                currentPage: 5,
                totalPages: 6,
                pagesPerStep: [5, 5, 5, 5, 5,5,5],
                width: screenWidth * 0.33,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                "Do you suffer from any diseases?",
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
                    goal['image']!,
                    screenWidth,
                  );
                },
              ),
            ),
            if (selectedGoals.contains("Other")) // عرض حقل الكتابة عند اختيار "Other"
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      otherText = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Please specify",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: ElevatedButton(
                onPressed: selectedGoals.isNotEmpty
                    ? () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IllnessAndInjury()));
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
      BuildContext context, String title, String imagePath, double screenWidth) {
    bool isSelected = selectedGoals.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedGoals.remove(title);
            if (title == "Other") {
              otherText = ""; // إعادة تعيين النص إذا تم إلغاء التحديد
            }
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
            Image.asset(
              imagePath,
              width: screenWidth * 0.30,
              height: screenWidth * 0.30,
            ),
            SizedBox(height: screenWidth * 0.02),
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
  {'title': 'None. I am healthy', 'image': 'assets/images/problem_9000296-removebg-preview.png'},
  {'title': 'Sugar', 'image': 'assets/images/dl.beatsnoop.com-high-3033d91e97a3b91c0a-removebg-preview.png'},
  {'title': 'Pressure', 'image': 'assets/images/Presseure.png'},
  {'title': 'Heart diseases', 'image': 'assets/images/Heart.png'},
  {'title': 'Lung problems', 'image': 'assets/images/Lung.png'},
  {'title': 'Other', 'image': 'assets/images/dl.beatsnoop.com-high-53d10eed4e4ae606b7.jpg'},
];
