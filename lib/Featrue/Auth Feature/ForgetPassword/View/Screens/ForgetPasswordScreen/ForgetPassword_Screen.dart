import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../View_model/ForgetPassword_Cubit/forget_password_cubit.dart';
import '../OTPScreen/OTPScreen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  // Controllers for form inputs
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _buildBackgroundImage(screenHeight),
                _buildTitleSubtitle(screenWidth, screenHeight),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLoginForm(),
                  const SizedBox(height: 15),
                  _buildActionButtons(screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputLabel("Email"),
          _buildEmailField(),

        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Your Email",
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildActionButtons(double screenWidth) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>
            (
              listener: (context,state) {
                if (state is ForgetPasswordSuccess){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=> SenOTPScreen(email : emailController.text)));
                }
              },
            builder: (context, state) {
             return GestureDetector(
               onTap: () async {
                 if ( emailController.text.isNotEmpty){
                   await ForgetPasswordCubit.get(context)
                       .forgetPassword(email: emailController.text);
                 } else {
                   ScaffoldMessenger(
                     child: Text('Email is Required'),
                   );
                 }
               },
               child: Container(
                 height: 50,
                 width: screenWidth * 0.7,
                 decoration: BoxDecoration(
                   color: kFirstColor,
                 ),
                 child: Center(
                   child: state is ForgetPasswordLoading
                   ? const CircularProgressIndicator(
                   color: Colors.white,
                 )
                   : Text('Next',
                     style: TextStyle(
                       color: Colors.white
                     ),
                   )
                 ),

               ),
                // text: "Next",
                // backgroundColor: kFirstColor,
                //
                // screenWidth: screenWidth,
              );
            },

          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    double? screenWidth,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: screenWidth! * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSubtitle(double screenWidth, double screenHeight) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [kThirdColor, Colors.transparent],
        ),
      ),
      height: screenHeight * 0.55,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                text: 'HARD\t',
                style: TextStyle(
                  fontFamily: "Bebas",
                  fontSize: 30,
                  letterSpacing: 5,
                ),
                children: [
                  TextSpan(
                    text: 'ELEMENT',
                    style: TextStyle(color: kFirstColor),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Enter Your Email To send An OTP To You",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(double screenHeight) {
    return Container(
      height: screenHeight * 0.55,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/12.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
