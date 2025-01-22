import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentPage; // الصفحة الحالية
  final int totalPages; // إجمالي عدد الصفحات داخل الخطوة
  final int currentStep; // الخطوة الحالية
  final List<int> pagesPerStep; // عدد الصفحات لكل خطوة
  final double? width; // عرض المؤشر
  final double? height; // ارتفاع المؤشر

  const ProgressIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.currentStep,
    required this.pagesPerStep,
    this.width,
    this.height, required int totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // تحديد العرض والارتفاع
    double progressIndicatorWidth = width ?? screenWidth * 0.8;
    double progressIndicatorHeight = height ?? screenWidth * 0.02;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pagesPerStep.length, (index) {
        bool isCompleted = index < currentStep; // هل الخطوة مكتملة
        bool isActive = index == currentStep; // هل هي الخطوة الحالية

        // نسبة التقدم داخل الخطوة
        double progress = (isActive && currentPage > 0)
            ? currentPage / pagesPerStep[index]
            : (isCompleted ? 1.0 : 0.0);

        return Row(
          children: [
            // دائرة الخطوة
            CircleAvatar(
              radius: screenWidth * 0.04,
              backgroundColor: isCompleted
                  ? Colors.green
                  : Colors.grey.shade300,
              child: isCompleted
                  ? Icon(Icons.check, color: Colors.white, size: screenWidth * 0.05)
                  : Text(
                "${index + 1}",
                style: TextStyle(
                  color: isActive ? Colors.green : Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ),
            // الخط الرابط بين الخطوات
            if (index < pagesPerStep.length - 1)
              Stack(
                children: [
                  // الخط الرمادي
                  Container(
                    width: progressIndicatorWidth * 0.2,
                    height: progressIndicatorHeight,
                    color: Colors.grey.shade300,
                  ),
                  // الخط الأزرق المكتمل
                  Container(
                    width: progressIndicatorWidth * 0.2 * progress,
                    height: progressIndicatorHeight,
                    color: Colors.green,
                  ),
                ],
              ),
          ],
        );
      }),
    );
  }
}
