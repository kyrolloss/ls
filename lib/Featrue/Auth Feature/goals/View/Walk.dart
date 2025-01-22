import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/BreakTwo.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/Rate.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/Widgets/View/ProgressIndicator.dart';

class WalkDaily extends StatefulWidget {
  const WalkDaily({super.key});

  @override
  State<WalkDaily> createState() => _WalkDailyState();
}

class _WalkDailyState extends State<WalkDaily> {
  int? selectedContainer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child:
                ProgressIndicatorWidget(
                  currentStep: 1,
                  totalSteps: 5,
                  currentPage: 5, // الصفحة الحالية داخل الخطوة
                  totalPages: 6, // إجمالي صفحات الخطوة الحالية
                  pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
                  width: size.width * 0.30,
                ),
              ),
              SizedBox(height: size.height*0.04,),
              Text(
                'How Much Do You Walk Daily?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: size.height * 0.05),

              // الخيارات
              _buildOption(
                title: 'Less Than 1 Hour',
                isSelected: selectedContainer == 1,
                onTap: () => setState(() => selectedContainer = 1),
              ),
              SizedBox(height: size.height * 0.02),
              _buildOption(
                title: '1-2 Hours',
                isSelected: selectedContainer == 2,
                onTap: () => setState(() => selectedContainer = 2),
              ),
              SizedBox(height: size.height * 0.02),
              _buildOption(
                title: 'More Than 2 Hours',
                isSelected: selectedContainer == 3,
                onTap: () => setState(() => selectedContainer = 3),
              ),
              SizedBox(height: size.height * 0.05),

              ElevatedButton(
                onPressed: selectedContainer != null
                    ? () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BodyDataPage()));
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedContainer != null
                      ? Colors.black
                      : Colors.grey,
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.015,
                    horizontal: size.width * 0.3,
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
