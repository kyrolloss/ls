import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/CurnnetBody.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/Rate.dart';
import 'dart:async';

import 'package:ls/Featrue/Auth%20Feature/goals/View/Shifts.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/Training.dart';

class FitnessData extends StatefulWidget {
  @override
  _FitnessDataState createState() => _FitnessDataState();
}

class _FitnessDataState extends State<FitnessData>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _imageAnimation;

  // متغيرات للتحكم في حجم ولون الشريط
  final double progressBarWidth = 220; // عرض الشريط
  final double progressBarHeight = 14; // ارتفاع الشريط
  final Color progressBarColor = Colors.blue; // لون الشريط الداخلي
  final Color outerBarColor = Colors.grey; // لون الشريط الخارجي

  @override
  void initState() {
    super.initState();

    // إعداد الحركة
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.5, end: 0.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _imageAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BodyShapeSelectionPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fitness Data Done',
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            AnimatedBuilder(
              animation: _imageAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _imageAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/Done.png', // استبدل your_image.png باسم ملف الصورة الخاص بك
                width: screenWidth * 0.4,
                height: screenHeight * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: progressBarWidth,
                  height: progressBarHeight,
                  decoration: BoxDecoration(
                    color: outerBarColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animation.value * progressBarWidth * 0.4, 0),
                      child: child,
                    );
                  },
                  child: Container(
                    width: progressBarWidth * 0.5, // عرض الشريط الداخلي
                    height: progressBarHeight,
                    decoration: BoxDecoration(
                      color: progressBarColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
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
