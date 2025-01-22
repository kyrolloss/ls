import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/WeightSelection.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';


class ShiftsPage extends StatefulWidget {
  const ShiftsPage({super.key});

  @override
  State<ShiftsPage> createState() => _ShiftsPageState();
}

class _ShiftsPageState extends State<ShiftsPage> {
  final List<Map<String, String>> options = [
    {'text': 'Morning shift', 'image': 'assets/images/Morning.jpg'},
    {'text': 'Evening shift', 'image': 'assets/images/Night.jpg'},
    {'text': 'Variable shifts', 'image': 'assets/images/Variables.jpg'},
    {'text': 'Student', 'image': 'assets/images/student.png'},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.06,
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.02,),
            // Progress Indicator
            ProgressIndicatorWidget(
              currentStep: 1,
              totalSteps: 5,
              currentPage: 1, // الصفحة الحالية داخل الخطوة
              totalPages: 6, // إجمالي صفحات الخطوة الحالية
              pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
              width: screenWidth * 0.33,
            ),
            SizedBox(height: screenHeight * 0.02),
            // العنوان الرئيسي
            Center(
              child: Text(
                'Work Routine',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.grey.shade400,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            // القائمة
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Future.delayed(const Duration(milliseconds: 300), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeightSelectionPage(),
                          ),
                        );
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.grey.shade200
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: selectedIndex == index ? 2 : 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // الصورة
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              options[index]['image']!,
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.06),
                          // النص
                          Expanded(
                            child: Text(
                              options[index]['text']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          // أيقونة اختيار
                          if (selectedIndex == index)
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: screenWidth * 0.06,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
