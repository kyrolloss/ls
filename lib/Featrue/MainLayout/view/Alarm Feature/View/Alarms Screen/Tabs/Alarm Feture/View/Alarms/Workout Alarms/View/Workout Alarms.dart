// import 'dart:io';
//
// import 'package:alarm/alarm.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:list_tile_switch/list_tile_switch.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Workout%20Alarms/Model/Workout%20Model.dart';
//
// import '../../../../../../Add Alarm Screen/Add Alarm Screen.dart';
// import '../View Model/workout_cubit.dart';
//
// class WorkoutAlarms extends StatefulWidget {
//   const WorkoutAlarms({super.key});
//
//   @override
//   State<WorkoutAlarms> createState() => _WorkoutAlarmsState();
// }
//
// class _WorkoutAlarmsState extends State<WorkoutAlarms> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.black,
//
//
//         body: BlocConsumer<WorkoutCubit, WorkoutState>(
//           listener: (context, state) {
//           },
//           builder: (context, state) {
//             return ListView.builder(
//                 itemCount: WorkoutCubit.get(context).workout.length,
//                 itemBuilder: (BuildContext, index) {
//                   return Container(
//                     padding: EdgeInsets.all(10),
//                     margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.white,width: .5),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: width * .25,
//                           child: Text(
//                             WorkoutCubit.get(context)
//                                 .workout[index]
//                                 .name
//                                 .toString(),
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: width * .0475,
//                                 color: Colors.white),
//                           ),
//                         ),
//                         SizedBox(
//                           width: width * .3,
//                           child: ListTileSwitch(
//                             switchInactiveColor: Colors.grey,
//                             value: WorkoutCubit.get(context)
//                                 .workout[index]
//                                 .status,
//                             onChanged: (value) async {
//                               WorkoutCubit.get(context)
//                                   .updateMealStatus(index, value);
//                               if (value) {
//                                 String time =
//                                 await WorkoutCubit.get(context)
//                                     .workout[index]
//                                     .time;
//                                 List<String> timeParts =
//                                 await time.split(':');
//                                 int hour =
//                                 await int.parse(timeParts[0]);
//                                 int minute =
//                                 await int.parse(timeParts[1]);
//                                 DateTime dateTime =
//                                 await DateTime.now();
//                                 if (hour.isLowerThan(dateTime.hour)) {
//                                   dateTime = await DateTime(
//                                     dateTime.year,
//                                     dateTime.month,
//                                     dateTime.day + 1,
//                                     hour,
//                                     minute,
//                                   );
//                                 } else {
//                                   if (hour.isEqual(dateTime.hour) &&
//                                       minute.isLowerThan(
//                                           dateTime.minute)) {
//                                     dateTime = await DateTime(
//                                       dateTime.year,
//                                       dateTime.month,
//                                       dateTime.day + 1,
//                                       hour,
//                                       minute,
//                                     );
//                                   }
//                                 }
//                                 DateTime newDateTime = await DateTime(
//                                   dateTime.year,
//                                   dateTime.month,
//                                   dateTime.day,
//                                   hour,
//                                   minute,
//                                 );
//
//                                 print(newDateTime);
//                                 AlarmSettings alarmSettings =
//                                 await AlarmSettings(
//                                   id: WorkoutCubit.get(context)
//                                       .workout[index]
//                                       .id,
//                                   dateTime: newDateTime,
//                                   assetAudioPath: 'assets/alarm.mp3',
//                                   loopAudio: true,
//                                   vibrate: true,
//                                   volume: 0.8,
//                                   fadeDuration: 3.0,
//                                   warningNotificationOnKill:
//                                   Platform.isIOS,
//                                   notificationSettings:
//                                   NotificationSettings(
//                                     body:
//                                     "Time for ${WorkoutCubit.get(context).workout[index].name}",
//                                     title: "Alarm",
//                                     stopButton: 'stop',
//                                   ),
//                                 );
//                                 await Alarm.set(
//                                     alarmSettings: alarmSettings);
//                               }
//                             },
//                             switchActiveColor: Colors.indigo,
//                           ),
//                         ),
//                         SizedBox(
//                           width: width * .25,
//                           child: TextButton(onPressed: ()async {
//                             TimeOfDay? pickedTime = await showTimePicker(
//                               context: context,
//                               initialTime: TimeOfDay.now(),
//                             );
//                             final now = DateTime.now();
//                             DateTime? selectedDateTime;
//
//                             if (pickedTime != null) {
//                               if (pickedTime.hour.isLowerThan(now.hour)) {
//                                 selectedDateTime = DateTime(
//                                   now.year,
//                                   now.month,
//                                   now.day + 1,
//                                   pickedTime.hour,
//                                   pickedTime.minute,
//                                 );
//                                 print(pickedTime.hour);
//                                 print(now.hour);
//                               } else {
//                                 if (pickedTime.hour.isEqual(now.hour) &&
//                                     pickedTime.minute.isLowerThan(now.minute)) {
//                                   selectedDateTime = DateTime(
//                                     now.year,
//                                     now.month,
//                                     now.day + 1,
//                                     pickedTime.hour,
//                                     pickedTime.minute,
//                                   );
//                                 } else {
//                                   selectedDateTime = DateTime(
//                                     now.year,
//                                     now.month,
//                                     now.day,
//                                     pickedTime.hour,
//                                     pickedTime.minute,
//                                   );
//                                 }
//                               }
//                               String formattedTime =
//                                   '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
//
//                               WorkoutCubit.get(context)
//                                   .updateMealTime(index, formattedTime);
//                               await Alarm.stop(
//                                   WorkoutCubit.get(context).workout[index].id);
//
//                               await Alarm.set(
//                                   alarmSettings: AlarmSettings(
//                                     id: WorkoutCubit.get(context).workout[index].id,
//                                     dateTime: selectedDateTime,
//                                     assetAudioPath: 'assets/alarm.mp3',
//                                     loopAudio: true,
//                                     vibrate: true,
//                                     volume: 0.8,
//                                     fadeDuration: 3.0,
//                                     warningNotificationOnKill: Platform.isIOS,
//                                     notificationSettings: NotificationSettings(
//                                       body:
//                                       "Time for ${WorkoutCubit.get(context).workout[index].name}",
//                                       title: "Alarm",
//                                       stopButton: 'stop',
//                                     ),
//                                   ));
//                               WorkoutCubit.get(context)
//                                   .updateMealStatus(index, true);
//                             }
//                           }, child:Text(
//                             WorkoutCubit.get(context).workout[index].time,
//                             textAlign: TextAlign.end,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: width * .0475,
//                                 color: Colors.white),
//                           ),),
//                         )
//                       ],
//                     ),
//                   );
//                 });
//           },
//         ));
//   }
// }
