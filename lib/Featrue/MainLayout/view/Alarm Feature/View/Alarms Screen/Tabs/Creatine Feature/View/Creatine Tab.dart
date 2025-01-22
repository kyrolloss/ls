// import 'dart:io';
//
// import 'package:alarm/alarm.dart';
// import 'package:alarm/model/alarm_settings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get_utils/get_utils.dart';
// import 'package:list_tile_switch/list_tile_switch.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Creatine%20Feature/View%20Model/creatine_cubit.dart';
// import 'package:rolling_switch/rolling_switch.dart';
//
// import '../../../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
// import '../../Alarm Feture/View/Alarms/Sleep Alarms/View Model/sleep_cubit.dart';
//
// class CreatineTab extends StatefulWidget {
//   const CreatineTab({super.key});
//
//   @override
//   State<CreatineTab> createState() => _CreatineTabState();
// }
//
// class _CreatineTabState extends State<CreatineTab> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: BlocConsumer<CreatineCubit, CreatineState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return  ListView.builder(
//               itemCount: CreatineCubit.get(context).water.length,
//               itemBuilder: (BuildContext, index) {
//                 return Container(
//                   padding: EdgeInsets.all(10),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.white, width: .5),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: width * .25,
//                             child: Text(
//                               CreatineCubit.get(context)
//                                   .water[index]
//                                   .name
//                                   .toString(),
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: width * .045,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//
//                           SizedBox(
//                             width: width * .3,
//                             child: ListTileSwitch(
//                               switchInactiveColor: Colors.grey,
//                               value: CreatineCubit.get(context)
//                                   .water[index]
//                                   .status,
//                               onChanged: (value) async {
//                                 CreatineCubit.get(context)
//                                     .updateMealStatus(index, value);
//                                 if (value) {
//                                   String time =
//                                   await CreatineCubit.get(context)
//                                       .water[index]
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
//                                     id: CreatineCubit.get(context)
//                                         .water[index]
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
//                                       "Time for ${CreatineCubit.get(context).water[index].name}",
//                                       title: "Alarm",
//                                       stopButton: 'stop',
//                                     ),
//                                   );
//                                   await Alarm.set(
//                                       alarmSettings: alarmSettings);
//                                 }
//                               },
//                               switchActiveColor: kSecondColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
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
//                               CreatineCubit.get(context)
//                                   .updateCreatineTime(index, formattedTime);
//                               await Alarm.stop(
//                                   CreatineCubit.get(context).water[index].id);
//
//                               await Alarm.set(
//                                   alarmSettings: AlarmSettings(
//                                     id: CreatineCubit.get(context).water[index].id,
//                                     dateTime: selectedDateTime,
//                                     assetAudioPath: 'assets/alarm.mp3',
//                                     loopAudio: true,
//                                     vibrate: true,
//                                     volume: 0.8,
//                                     fadeDuration: 3.0,
//                                     warningNotificationOnKill: Platform.isIOS,
//                                     notificationSettings: NotificationSettings(
//                                       body:
//                                       "Time for ${CreatineCubit.get(context).water[index].name}",
//                                       title: "Alarm",
//                                       stopButton: 'stop',
//                                     ),
//                                   ));
//                               CreatineCubit.get(context)
//                                   .updateMealStatus(index, true);
//                             }
//                           }, child:Text(
//                             CreatineCubit.get(context).water[index].time,
//                             textAlign: TextAlign.end,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: width * .045,
//                               color: Colors.white,
//                             ),
//                           ),)
//                       ),
//                     ],
//                   ),
//                 );
//               });
//         },
//       ),
//     );
//   }
// }
