// import 'package:flutter/material.dart';
// import 'dart:io';
//
// import 'package:alarm/alarm.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get_utils/get_utils.dart';
// import 'package:list_tile_switch/list_tile_switch.dart';
// import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
// import '../View Model/alarm_cubit.dart';
//
// class MealsAlarms extends StatefulWidget {
//   const MealsAlarms({super.key});
//
//   @override
//   State<MealsAlarms> createState() => _MealsAlarmsState();
// }
//
// class _MealsAlarmsState extends State<MealsAlarms> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: BlocConsumer<AlarmCubit, AlarmState>(
//           listener: (context, state) {
//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             return ListView.builder(
//                 itemCount: AlarmCubit.get(context).meals.length,
//                 itemBuilder: (BuildContext, index) {
//                   return Container(
//                     padding: EdgeInsets.all(10),
//                     margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.white, width: .5),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: width * .25,
//                               child: Text(
//                                 AlarmCubit.get(context)
//                                     .meals[index]
//                                     .name
//                                     .toString(),
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: width * .045,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//
//                             SizedBox(
//                               width: width * .3,
//                               child: ListTileSwitch(
//                                 switchInactiveColor: Colors.grey,
//                                 value: AlarmCubit.get(context)
//                                     .meals[index]
//                                     .status,
//                                 onChanged: (value) async {
//                                   AlarmCubit.get(context)
//                                       .updateMealStatus(index, value);
//                                   if (value) {
//                                     String time =
//                                         await AlarmCubit.get(context)
//                                             .meals[index]
//                                             .time;
//                                     List<String> timeParts =
//                                         await time.split(':');
//                                     int hour =
//                                         await int.parse(timeParts[0]);
//                                     int minute =
//                                         await int.parse(timeParts[1]);
//                                     DateTime dateTime =
//                                         await DateTime.now();
//                                     if (hour.isLowerThan(dateTime.hour)) {
//                                       dateTime = await DateTime(
//                                         dateTime.year,
//                                         dateTime.month,
//                                         dateTime.day + 1,
//                                         hour,
//                                         minute,
//                                       );
//                                     } else {
//                                       if (hour.isEqual(dateTime.hour) &&
//                                           minute.isLowerThan(
//                                               dateTime.minute)) {
//                                         dateTime = await DateTime(
//                                           dateTime.year,
//                                           dateTime.month,
//                                           dateTime.day + 1,
//                                           hour,
//                                           minute,
//                                         );
//                                       }
//                                     }
//                                     DateTime newDateTime = await DateTime(
//                                       dateTime.year,
//                                       dateTime.month,
//                                       dateTime.day,
//                                       hour,
//                                       minute,
//                                     );
//
//                                     print(newDateTime);
//                                     AlarmSettings alarmSettings =
//                                         await AlarmSettings(
//                                       id: AlarmCubit.get(context)
//                                           .meals[index]
//                                           .id,
//                                       dateTime: newDateTime,
//                                       assetAudioPath: 'assets/alarm.mp3',
//                                       loopAudio: true,
//                                       vibrate: true,
//                                       volume: 0.8,
//                                       fadeDuration: 3.0,
//                                       warningNotificationOnKill:
//                                           Platform.isIOS,
//                                       notificationSettings:
//                                           NotificationSettings(
//                                         body:
//                                             "Time for ${AlarmCubit.get(context).meals[index].name}",
//                                         title: "Alarm",
//                                         stopButton: 'stop',
//                                       ),
//                                     );
//                                     await Alarm.set(
//                                         alarmSettings: alarmSettings);
//                                   }
//                                 },
//                                 switchActiveColor: kSecondColor,
//                               ),
//                             ),
//                           ],
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
//                               AlarmCubit.get(context)
//                                   .updateMealTime(index, formattedTime);
//                               await Alarm.stop(
//                                   AlarmCubit.get(context).meals[index].id);
//
//                               await Alarm.set(
//                                   alarmSettings: AlarmSettings(
//                                     id: AlarmCubit.get(context).meals[index].id,
//                                     dateTime: selectedDateTime,
//                                     assetAudioPath: 'assets/alarm.mp3',
//                                     loopAudio: true,
//                                     vibrate: true,
//                                     volume: 0.8,
//                                     fadeDuration: 3.0,
//                                     warningNotificationOnKill: Platform.isIOS,
//                                     notificationSettings: NotificationSettings(
//                                       body:
//                                       "Time for ${AlarmCubit.get(context).meals[index].name}",
//                                       title: "Alarm",
//                                       stopButton: 'stop',
//                                     ),
//                                   ));
//                               AlarmCubit.get(context)
//                                   .updateMealStatus(index, true);
//                             }
//                           }, child:Text(
//                             AlarmCubit.get(context).meals[index].time,
//                             textAlign: TextAlign.end,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: width * .045,
//                               color: Colors.white,
//                             ),
//                           ),)
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           },
//         ));
//   }
// }
