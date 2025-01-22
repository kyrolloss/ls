import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/CoachRequest/View/CoachRequestAge.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/Contact.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';

import 'CoachRequestEmail.dart';
import 'introduceYourSelf.dart';


class NumberOfTrainees extends StatefulWidget {
  const NumberOfTrainees({super.key});


  @override
  State<NumberOfTrainees> createState() => _NumberOfTraineesState();
}


class _NumberOfTraineesState extends State<NumberOfTrainees> {
  final TextEditingController NumberOfTrainees = TextEditingController();
  bool isButtonEnabled = false;


  @override
  void initState() {
    super.initState();
    NumberOfTrainees.addListener(() {
      setState(() {
        isButtonEnabled = NumberOfTrainees.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    NumberOfTrainees.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: size.height*0.05 ,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child:  ProgressIndicatorWidget(
                currentStep: 0,
                totalSteps: 5,
                currentPage: 4, // الصفحة الحالية داخل الخطوة
                totalPages: 6, // إجمالي صفحات الخطوة الحالية
                pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
                width: screenWidth * 0.33,
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: size.height * 0.027,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/Experience.png',
                    width: size.width,
                    height: size.height * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),

                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.4),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.08, vertical: size.height * 0.05),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Number Of Trainees You Have Trained ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.width * 0.06,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            TextFormField(
                              controller: NumberOfTrainees,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                                prefixIcon: Icon(Icons.numbers_outlined , color: Colors.blue),
                              ),
                            ),
                            SizedBox(height: size.height * 0.2),
                            ElevatedButton(
                              onPressed: isButtonEnabled
                                  ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IntroduceYourSelf(),
                                  ),
                                );
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.3, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor:
                                isButtonEnabled ? Colors.black : Colors.grey,
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
