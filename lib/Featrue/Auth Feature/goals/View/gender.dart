import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/nationalty.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/viewModel/goals_cubit.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:ls/generated/l10n.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'AgeSelection.dart';
class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String?  selectedGender;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
             vertical: screenHeight * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               ProgressIndicatorWidget(
                currentStep: 0,
                totalSteps: 5,
                currentPage: 2, // الصفحة الحالية داخل الخطوة
                totalPages: 6, // إجمالي صفحات الخطوة الحالية
                pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
                width: screenWidth * 0.33,
            ),
            SizedBox(height: screenHeight*0.06,),
            Text(
              S.of(context).what_is_your_gender,
              style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.10),
            // Gender Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genderCard(
                  S.of(context).female,
                  'assets/images/Woman.png', // Update with your asset path
                  selectedGender == "Female",
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(width: screenWidth * 0.05),
                genderCard(
                  S.of(context).male,
                  'assets/images/Men.png', // Update with your asset path
                  selectedGender == "Male",
                  screenWidth,
                  screenHeight,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.10),
            Spacer(),
            ElevatedButton(
              onPressed: selectedGender != null
                  ? () {
                GoalsCubit.get(context).setGender(selectedGender!);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>NationaltyPage())
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, horizontal: screenWidth * 0.3), backgroundColor: selectedGender != null ? Colors.black : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: selectedGender != null ? Colors.white : Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget genderCard(String gender, String imagePath, bool isSelected,
      double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: screenWidth * 0.35,
              height: screenHeight * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              gender,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}