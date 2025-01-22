import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/MainLayOut.dart';
import '../../onboarding/View/Screens/Onboarding1_screen.dart';
import '../../onboarding/View/Screens/Onboarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 3), () {

      if ( LoginCubit.token != '') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  MainLayout()));
      }
      if ( LoginCubit.token == '') {
        Navigator.push(
            context,
            MaterialPageRoute(
                  builder: (context) =>  welcomePage()));
      }

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) =>  welcomePage()),
            // );
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageHeight = screenSize.height;
    var imageWidth = screenSize.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: imageWidth,
          height: imageHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/LogoLs.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}