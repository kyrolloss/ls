// import 'dart:io';
//
// import 'package:alarm/alarm.dart';
// import 'package:alarm/model/notification_settings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:list_tile_switch/list_tile_switch.dart';
//
// import '../../../../../../Add Alarm Screen/Add Alarm Screen.dart';
// import '../View Model/supplements_cubit.dart';
//
// class SupplementsAlarms extends StatefulWidget {
//   const SupplementsAlarms({super.key});
//
//   @override
//   State<SupplementsAlarms> createState() => _SupplementsAlarmsState();
// }
//
// class _SupplementsAlarmsState extends State<SupplementsAlarms> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.black,
//         body: BlocConsumer<SupplementsCubit, SupplementsState>(
//           listener: (context, state) {
//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             return ListView.builder(
//                 itemCount: SupplementsCubit.get(context).supplements.length,
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
//
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: width * .25,
//
//                           child: Text(
//                             SupplementsCubit.get(context)
//                                 .supplements[index]
//                                 .name
//                                 .toString(),
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: width * .045,
//                                 color: Colors.white),
//                           ),
//                         ),
//
//                         SizedBox(
//                           width: width * .3,
//                           child: Center(
//                             child: ListTileSwitch(
//                               switchInactiveColor: Colors.grey,
//                               value: SupplementsCubit.get(context)
//                                   .supplements[index]
//                                   .status,
//                               onChanged: (value) async {
//                                 SupplementsCubit.get(context)
//                                     .updateSupplementStatus(index, value);
//                                 if (value) {
//                                   String time =
//                                   await SupplementsCubit.get(context)
//                                       .supplements[index]
//                                       .time;
//                                   List<String> timeParts =
//                                   await time.split(':');
//                                   int hour =
//                                   await int.parse(timeParts[0]);
//                                   int minute =
//                                   await int.parse(timeParts[1]);
//                                   DateTime dateTime =
//                                   await DateTime.now();
//                                   if (hour.isLowerThan(dateTime.hour)) {
//                                     dateTime = await DateTime(
//                                       dateTime.year,
//                                       dateTime.month,
//                                       dateTime.day + 1,
//                                       hour,
//                                       minute,
//                                     );
//                                   } else {
//                                     if (hour.isEqual(dateTime.hour) &&
//                                         minute.isLowerThan(
//                                             dateTime.minute)) {
//                                       dateTime = await DateTime(
//                                         dateTime.year,
//                                         dateTime.month,
//                                         dateTime.day + 1,
//                                         hour,
//                                         minute,
//                                       );
//                                     }
//                                   }
//                                   DateTime newDateTime = await DateTime(
//                                     dateTime.year,
//                                     dateTime.month,
//                                     dateTime.day,
//                                     hour,
//                                     minute,
//                                   );
//
//                                   print(newDateTime);
//                                   AlarmSettings alarmSettings =
//                                   await AlarmSettings(
//                                     id: SupplementsCubit.get(context)
//                                         .supplements[index]
//                                         .id,
//                                     dateTime: newDateTime,
//                                     assetAudioPath: 'assets/alarm.mp3',
//                                     loopAudio: true,
//                                     vibrate: true,
//                                     volume: 0.8,
//                                     fadeDuration: 3.0,
//                                     warningNotificationOnKill:
//                                     Platform.isIOS,
//                                     notificationSettings:
//                                     NotificationSettings(
//                                       body:
//                                       "Time for ${SupplementsCubit.get(context).supplements[index].name}",
//                                       title: "Alarm",
//                                       stopButton: 'stop',
//                                     ),
//                                   );
//                                   await Alarm.set(
//                                       alarmSettings: alarmSettings);
//                                 }
//                               },
//                               switchActiveColor: Colors.indigo,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: width * .25,
//                           child: TextButton(onPressed: () async{
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
//                               SupplementsCubit.get(context)
//                                   .updateMealTime(index, formattedTime);
//                               await Alarm.stop(
//                                   SupplementsCubit.get(context).supplements[index].id);
//
//                               await Alarm.set(
//                                   alarmSettings: AlarmSettings(
//                                     id: SupplementsCubit.get(context).supplements[index].id,
//                                     dateTime: selectedDateTime,
//                                     assetAudioPath: 'assets/alarm.mp3',
//                                     loopAudio: true,
//                                     vibrate: true,
//                                     volume: 0.8,
//                                     fadeDuration: 3.0,
//                                     warningNotificationOnKill: Platform.isIOS,
//                                     notificationSettings: NotificationSettings(
//                                       body:
//                                       "Time for ${SupplementsCubit.get(context).supplements[index].name}",
//                                       title: "Alarm",
//                                       stopButton: 'stop',
//                                     ),
//                                   ));
//                               SupplementsCubit.get(context)
//                                   .updateSupplementStatus(index, true);
//                             }
//                           }, child: Text(
//                             SupplementsCubit.get(context).supplements[index].time,
//                             textAlign: TextAlign.end,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: width * .045,
//                                 color: Colors.white),
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
//
