// import 'package:flutter/material.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Meal%20Alarms/View%20Model/alarm_cubit.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Meal%20Alarms/View/Meal%20Alarms.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Sleep%20Alarms/View%20Model/sleep_cubit.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Sleep%20Alarms/View/Sleep%20Alarms.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Supplement%20Meals/View%20Model/supplements_cubit.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Supplement%20Meals/View/Supplement%20Meals.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Workout%20Alarms/View%20Model/workout_cubit.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Workout%20Alarms/View/Workout%20Alarms.dart';
//
// class AlarmSchedule extends StatefulWidget {
//   const AlarmSchedule({super.key});
//
//   @override
//   State<AlarmSchedule> createState() => _AlarmScheduleState();
// }
//
// class _AlarmScheduleState extends State<AlarmSchedule> {
//   final List<String> schedules = [
//     'Meals',
//     'Supplements',
//     'Sleep & Wake Up',
//     'Workout',
//   ];
//
//   final List<String> scheduleDescriptions = [
//     'Sticking to meal times is crucial for maintaining balanced energy and avoiding digestive issues.',
//     'Taking supplements at the right time ensures they are absorbed effectively and provide optimal benefits.',
//     'Maintaining consistent sleep and wake-up times is key for better rest, improved mood, and daily performance.',
//     'Keeping a regular workout schedule helps build discipline, boosts fitness progress, and improves recovery.'
//   ];
//
//   List<IconData> scheduleIcons = [
//     Icons.restaurant,
//     Icons.medication_liquid,
//     Icons.bedtime,
//     Icons.fitness_center
//   ];
//
//   List<Widget> scheduleScreen = [
//     MealsAlarms(),
//     SupplementsAlarms(),
//     SleepAlarms(),
//     WorkoutAlarms(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: schedules.length,
//         itemBuilder: (context, index) {
//           List<String> scheduleNumbers = [
//             AlarmCubit.get(context).meals.length.toString(),
//             SupplementsCubit.get(context).supplements.length.toString(),
//             SleepCubit.get(context).sleep.length.toString(),
//             WorkoutCubit.get(context).workout.length.toString(),
//           ];
//           return GestureDetector(
//             onTap: () {
//
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => scheduleScreen[index]));
//             },
//             child: Container(
//               padding: EdgeInsets.all(20),
//               margin: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Color(0xff40D876),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 //scheduleDescriptions
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Icon(
//                         scheduleIcons[index],
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: width * .045,
//                       ),
//                       //scheduleNumbers
//                       Text(schedules[index],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: width * 0.0625,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Spacer(),
//                       Icon(
//                         Icons.alarm,
//                         color: Colors.white,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Text(scheduleDescriptions[index],
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: width * 0.045,
//                         fontWeight: FontWeight.w500,
//                       )),
//                   SizedBox(height: 10),
//
//                   //scheduleNumbers
//                   Text('${scheduleNumbers[index]} Alarms',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: width * 0.035,
//                         fontWeight: FontWeight.w500,
//                       )),
//                 ],
//               ),
//             ),
//           );
//         }
//       ),
//     );
//   }
// }
