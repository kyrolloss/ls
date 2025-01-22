import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/BreakFive.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/FitnessEquipment.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/TrainingKind.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/TrainingWays.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'Rate.dart';

class HearingAboutUs extends StatefulWidget {
  @override
  _HearingAboutUsState createState() => _HearingAboutUsState();
}

class _HearingAboutUsState extends State<HearingAboutUs> {
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
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                child:
                ProgressIndicatorWidget(
                  currentStep: 4,
                  totalSteps: 5,
                  currentPage: 5 ,
                  totalPages: 6,
                  pagesPerStep: [5, 5, 5, 5, 5,5,5],
                  width: screenWidth * 0.33,
                )
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                "Where did you hear about us?",
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
                      builder: (context) => FitnessDataTwo(),
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
  Widget buildGoalOption(BuildContext context, String title, double screenWidth) {
    bool isSelected = selectedGoals.contains(title);

    // اختر الأيقونة المناسبة لكل عنوان
    IconData getIcon(String title) {
      switch (title) {
        case 'FaceBook':
          return Icons.facebook; // أيقونة Facebook
        case 'TikTok':
          return Icons.tiktok_outlined; // لا يوجد أيقونة مباشرة لـ TikTok، استخدم بديل
        case 'Instagram':
          return Icons.camera_alt; // أيقونة الكاميرا كبديل لـ Instagram
        case 'Twitter':
          return Icons.alternate_email; // أيقونة البريد الإلكتروني كبديل لـ Twitter
        default:
          return Icons.help; // أيقونة افتراضية
      }
    }

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
            SizedBox(height: 10), // مسافة بين النص والأيقونة
            Icon(
              getIcon(title),
              size: screenWidth * 0.1,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

}

final List<Map<String, String>> goals = [
  {'title': 'FaceBook', },
  {'title': 'TikTok', },
  {'title': 'Instagram', },
  {'title': 'Twitter', },
];
