import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../View_model/ForgetPassword_Cubit/forget_password_cubit.dart';
import '../../../View_model/OTPScree_Cubit/otp_cubit.dart';
import '../NewPasswordScreen/Newpassword_Screen.dart';

class SenOTPScreen extends StatefulWidget {
  final String email;
  const SenOTPScreen({super.key, required this.email});

  @override
  State<SenOTPScreen> createState() => _SenOTPScreenState();
}

class _SenOTPScreenState extends State<SenOTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();
  final TextEditingController _otpController6 = TextEditingController();

  String theOtp = "";

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
                  _buildOTPInputFields(),
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

  Widget _buildOTPInputFields() {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOTPField(_otpController1),
          _buildOTPField(_otpController2),
          _buildOTPField(_otpController3),
          _buildOTPField(_otpController4),
          _buildOTPField(_otpController5),
          _buildOTPField(_otpController6),
        ],
      ),
    );
  }

  Widget _buildOTPField(TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.12,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 24),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  Widget _buildActionButtons(double screenWidth) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<OtpCubit,OtpState>(
            listener: (context,state){
              if (state is VerifyEmailSuccess){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> NewPasswordScreen(email : widget.email, otp : theOtp)));
              }
              if (state is VerifyEmailError){
                showDialog(context: context ,
                    builder: (context)=> AlertDialog(
                      title: Text('Error'),
                      content: Text(state.message),
                      actions: [
                        TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Ok'))
                      ],
                    )
                );
              }
            },
            builder: (context,state){
              return GestureDetector(
                onTap: () async {
                  String OTP =
                      _otpController1.text+
                      _otpController2.text+
                      _otpController3.text+
                      _otpController4.text+
                      _otpController5.text+
                      _otpController6.text;
                  theOtp = OTP;
                  await OtpCubit.get(context).verifyOTP( otp: OTP);
                },
                child:  Container(
                  height: 50,
                  width: screenWidth * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child:  Center(
                    child : state is ForgetPasswordLoading
                        ? const CircularProgressIndicator(color: Colors.black )
                        : Text( 'Reset Password',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.5,
                            letterSpacing: 1.5)),
                  ),
                ),

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
          children: const [
            SizedBox(height: 270),
            Text(
              "Enter OTP",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter the 6-digit OTP sent to your number",
              style: TextStyle(fontSize: 20, color: Colors.white),
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
