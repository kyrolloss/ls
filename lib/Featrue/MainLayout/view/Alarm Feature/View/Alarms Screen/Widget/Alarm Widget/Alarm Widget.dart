import 'package:flutter/material.dart';

Widget AlarmWidget({required String Meal}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "9:00 AM",
              style: TextStyle(
                  color: Colors.white, fontSize: 27, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        Text(
          Meal,
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
