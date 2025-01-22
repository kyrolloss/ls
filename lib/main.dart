import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ls/Core/DataBase/Local_database/cach_helper.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/TraingTime.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/viewModel/goals_cubit.dart';
import 'package:ls/Featrue/Intro%20Feature/Splash/View/Splash_Screen.dart';
import 'package:ls/Featrue/MainLayout/View%20Model/main_layout_model_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Vitamine%20Alarms/View%20Model/vitamin_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/View%20Model/courses_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/View/SeeMoreCourses/ViewModel/more_courses_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculatorFilter/ViewModel/food_calculator_filter_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/Nutrition%20Feature/View%20Model/nutrition_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/MainLayOut.dart';
import 'package:ls/Featrue/MainLayout/view/Settings/View%20Model/counter_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Vitamins%20Features/Model%20View/vitamin_cubit.dart';
import 'package:ls/generated/l10n.dart';
import 'package:ls/try.dart';
import 'package:ls/try2.dart';
import 'package:ls/try3.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/ForgetPassword_Cubit/forget_password_cubit.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/NewPassword_cubit/new_password_cubit.dart';
import 'Featrue/Auth Feature/ForgetPassword/View_model/OTPScree_Cubit/otp_cubit.dart';
import 'Featrue/Auth Feature/Register/view_model/regester_cubit.dart';
import 'Featrue/Auth Feature/login/view/Screens/login_screen.dart';
import 'Featrue/Auth Feature/login/view_mode/login_cubit.dart';
import 'Featrue/Intro Feature/onboarding/View/Widget/colors.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Meal Alarms/View Model/alarm_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Sleep Alarms/View Model/sleep_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Supplement Meals/View Model/supplements_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Workout Alarms/View Model/workout_cubit.dart';
import 'Featrue/MainLayout/view/Alarm Feature/View/Alarms Screen/Tabs/Creatine Feature/View Model/creatine_cubit.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Featrue/MainLayout/view/Chat Feature/View Model/chat_cubit.dart';
import 'Featrue/MainLayout/view/Exercise/view/DetailsExercise/View Model/exercises_details_cubit.dart';
import 'Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculatorDetails/viewmodel/food_calculator_Details_cubit.dart';
import 'Featrue/MainLayout/view/Home/View/FoodCalculator/view_Model/food_calculator_cubit.dart';
import 'Featrue/MainLayout/view/Home/View/Progress Feature/View Model/progress_cubit.dart';
import 'Featrue/MainLayout/view/Notification/View Model/notification_cubit.dart';
import 'Featrue/MainLayout/view/Person/View/PersonView.dart';
import 'Featrue/MainLayout/view/Profile/ChangePassword/view_model/change_password_cubit.dart';
import 'Featrue/MainLayout/view/Profile/EditProfile/View_Model/edit_profile_cubit.dart';
import 'Featrue/MainLayout/view/Profile/view_model/profile_cubit.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Alarm.init();
  await DioHelper.init();
  await CashHelper.init();
  await CashHelper.getUserInfo();
  // await CashHelper.deleteAll();

  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? sub;

  @override
  void initState() {
    super.initState();
    // _secureScreen();.
    final now = DateTime.now();
    // Alarm.ringStream.stream.listen((_) async {
    //   await Alarm.set(
    //     alarmSettings: AlarmSettings(
    //         id: _.id,
    //         dateTime: DateTime(now.year, now.month, now.day + 1,
    //             _.dateTime.hour, _.dateTime.minute),
    //         assetAudioPath: _.assetAudioPath,
    //         notificationSettings: _.notificationSettings),
    //   );
    // });
  }

  // Future<void> _secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) {
          print('notification cubit');
          return NotificationCubit();
        }),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ForgetPasswordCubit()),
        BlocProvider(create: (context) => OtpCubit()),
        BlocProvider(create: (context) => NewPasswordCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(create: (context) => ExerciseCubit()),
        BlocProvider(
            create: (context) => CreatineCubit()
              ..getAlarmState()
              ..getSleepTime()
              ..getWakeUpTime()
              ..initializeCreatine()),
        BlocProvider(create: (context) => ExerciseCubit()),
        BlocProvider(create: (context) => GoalsCubit()),
        BlocProvider(create: (context) => ProgressCubit()),
        BlocProvider(create: (context) => FoodCalculatorCubit()),
        BlocProvider(create: (context) => FoodCalculatorDetailsCubit()),
        BlocProvider(
            create: (context) => AlarmCubit()
              ..initializeMeals()
              ..GetData()),
        BlocProvider(
            create: (context) => SupplementsCubit()
              ..initializeSupplements()
              ..GetData()),
        BlocProvider(
            create: (context) => WorkoutCubit()
              ..initializeWorkout()
              ..GetData()),
        BlocProvider(
            create: (context) => SleepCubit()
              ..initializeSleep()
              ..GetData()),
        BlocProvider(
            create: (context) => VitaminCubit()
              ..initializeVitamin()
              ..GetData()),
        BlocProvider(
            create: (context) => CounterCubit()
              ..GetData()
              ..GetCounter()),
        BlocProvider(create: (context) => ExercisesDetailsCubit()),
        BlocProvider(create: (context) => NutritionCubit()),
        BlocProvider(create: (context) => FoodCalculatorFilterCubit()),
        BlocProvider(
          create: (context) => MainLayoutModelCubit(),
        ),
        BlocProvider(
          create: (context) => CoursesCubit(),
        ),
        BlocProvider(
          create: (context) => VitaminScreenCubit()
            ..getAllVitamins()
            ..getAllSupplements(),
        ),
        BlocProvider(create: (context) => MoreCoursesCubit()),
        BlocProvider(create: (context) => ChatCubit())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black),
        home: CashHelper.getFromCash(key: 'token') == ''
            ? const SplashScreen()
            : MainLayout(),
      ),
    );
  }
}
