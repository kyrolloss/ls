// import 'dart:io';
// import 'dart:math';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
//
// import 'package:alarm/alarm.dart';
// import 'package:alarm/model/alarm_settings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Supplement%20Meals/Model/Supplement.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Vitamine%20Alarms/View%20Model/vitamin_cubit.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Creatine%20Feature/View%20Model/creatine_cubit.dart';
//
// import '../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
// import '../Tabs/Alarm Feture/View/Alarms/Meal Alarms/View Model/alarm_cubit.dart';
// import '../Tabs/Alarm Feture/View/Alarms/Sleep Alarms/View Model/sleep_cubit.dart';
// import '../Tabs/Alarm Feture/View/Alarms/Supplement Meals/View Model/supplements_cubit.dart';
// import '../Tabs/Alarm Feture/View/Alarms/Workout Alarms/View Model/workout_cubit.dart';
//
// class AddAlarm extends StatefulWidget {
//   final int index;
//
//   const AddAlarm({super.key, required this.index});
//
//   @override
//   State<AddAlarm> createState() => _AddAlaramState();
// }
//
// class _AddAlaramState extends State<AddAlarm> {
//
//   String? dateTime;
//   bool repeat = false;
//
//   DateTime? notificationtime;
//
//   String? name = "none";
//   int? Milliseconds;
//   late TextEditingController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController();
//   }
//
//   DateTime nextAlarmTime() {
//     final now = DateTime.now();
//     final alarmTime = DateTime(now.year, now.month, now.day, 8, 0); // 8:00 AM
//
//     if (now.isAfter(alarmTime)) {
//       return alarmTime
//           .add(Duration(days: 1));
//     } else {
//       return alarmTime;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         automaticallyImplyLeading: true,
//         title: const Text(
//           'Add Alarm',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width,
//                 child: CupertinoTheme(
//                   data: CupertinoThemeData(
//                     textTheme: CupertinoTextThemeData(
//                       dateTimePickerTextStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                       ),
//                     ),
//                   ),
//                   child: CupertinoDatePicker(
//                     backgroundColor: Colors.transparent,
//                     mode: CupertinoDatePickerMode.time,
//                     showDayOfWeek: false,
//                     dateOrder: DatePickerDateOrder.dmy,
//                     onDateTimeChanged: (va) {
//                       dateTime = DateFormat('HH:mm').format(va);
//                       Milliseconds = va.microsecondsSinceEpoch;
//                       notificationtime = va;
//                     },
//                   ),
//                 )),
//             SizedBox(
//               height: height * .05,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: CupertinoTextField(
//                     cursorColor: Color(0xFF40D876),
//                     padding: EdgeInsets.all(15),
//                     placeholder: "Add Label",
//                     style: TextStyle(color: Colors.white),
//                     placeholderStyle: TextStyle(color: Colors.white),
//                     controller: controller,
//                     decoration: BoxDecoration(
//                       color: kThirdColor,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.white30, width: .25),
//                     ),
//                     strutStyle: StrutStyle(height: 1.5),
//                     autocorrect: true,
//                   )),
//             ),
//             SizedBox(height: height * .035),
//             InkWell(
//               onTap:()
//               async {
//                 if (
//                 dateTime == null
//                 ){
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Enter Date and Time'),
//                     ),
//                   );
//                 }
//                 if (controller.text.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Enter Label'),
//                     ),
//                   );
//                 } else {
//                   int id = AlarmCubit.get(context)
//                       .generateUniqueId(AlarmCubit.get(context).meals);
//
//                   final alarmSettings = AlarmSettings(
//                     id: id,
//                     dateTime: notificationtime!,
//                     assetAudioPath: 'assets/alarm.mp3',
//                     loopAudio: true,
//                     vibrate: true,
//                     volume: 0.8,
//                     fadeDuration: 3.0,
//                     warningNotificationOnKill: Platform.isIOS,
//                     notificationSettings: NotificationSettings(
//                       body: "Time for ${controller.text}",
//                       title: "Alarm",
//                       stopButton: 'stop',
//                     ),
//                   );
//                   await Alarm.set(
//                     alarmSettings: alarmSettings,
//                   );
//
//                   if (widget.index == 0) {
//
//
//                     AlarmCubit.get(context).SetAlaram(controller.text,
//                         dateTime!, true, '', id, Milliseconds!);
//                   }
//                   if (widget.index == 1) {
//                     SupplementsCubit.get(context).SetAlaram(controller.text,
//                         dateTime!, true, '', id, Milliseconds!);
//                   }
//                   if (widget.index == 2) {
//                     SleepCubit.get(context).SetAlaram(controller.text,
//                         dateTime!, true, '', id, Milliseconds!);
//                   }
//                   if (widget.index == 3) {
//                     WorkoutCubit.get(context).SetAlaram(controller.text,
//                         dateTime!, true, '', id, Milliseconds!);
//                   }
//                   if (widget.index == 4) {
//                     VitaminCubit.get(context).SetAlaram(controller.text,
//                         dateTime!, true, '', id, Milliseconds!);
//                   }
//                   if (widget.index == 5) {
//                     CreatineCubit.get(context).SetAlaram(controller.text,
//                         dateTime!, true, '', id, Milliseconds!);
//                   }
//
//                   Navigator.pop(context);
//                 }
//               },
//               child: Container(
//                 height: height * .055,
//                 width: width*.35,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Center(
//                   child: Text('Set Alarm', style: TextStyle(color: Colors.black , fontSize: width*.05 , fontWeight: FontWeight.w500),),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
