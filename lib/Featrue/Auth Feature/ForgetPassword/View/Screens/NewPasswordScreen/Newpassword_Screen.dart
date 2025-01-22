import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../../login/view/Screens/login_screen.dart';
import '../../../View_model/NewPassword_cubit/new_password_cubit.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;
  const NewPasswordScreen({super.key, required this.email, required this.otp});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for new password and confirm password
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                  _buildPasswordInputFields(screenWidth),
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

  // Build input fields for new password and confirm password
  Widget _buildPasswordInputFields(double screenWidth) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildPasswordField(
            controller: newPasswordController,
            labelText: 'New Password',
          ),
          const SizedBox(height: 15),
          _buildPasswordField(
            controller: confirmPasswordController,
            labelText: 'Confirm Password',
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true, // Hide password input
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required';
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
          BlocConsumer<NewPasswordCubit,NewPasswordState>(
            listener: (context,state){
              if(state is NewPasswordSuccess){
                Navigator.pushAndRemoveUntil(context,
                 MaterialPageRoute(builder: (context)=>LoginView()),
                   (route) => false);
                final snackBar =SnackBar(
                  elevation: 0,
                  behavior:
                  SnackBarBehavior.floating,
                  backgroundColor:
                  Colors.transparent,
                  content:
                  AwesomeSnackbarContent(
                    title:
                    'Password Reset Success',
                    color: const Color(
                        0xff012776),
                    message:
                    state.message,
                    contentType:
                    ContentType
                        .success,
                  ),
                );
                ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              }
            }, builder: (context, state){
              return GestureDetector(
                onTap: () async {
                  if (newPasswordController.text == confirmPasswordController.text) {
                    NewPasswordCubit.get(context).Newpassword(
                        email: widget.email,
                        newPassword: newPasswordController.text,
                        confirmNewPassword: confirmPasswordController.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginView()),
                            (Route<dynamic> route) => false);
                  } else {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Error',
                        color: const Color(0xfff01313),
                        message: 'Passwords do not match!',
                        contentType: ContentType.failure,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }

                },
                child: Container(
                  height: 50,
                  width: screenWidth * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Center(
                    child: state is NewPasswordLoading
                    ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                    : Text('Submit',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.5,
                            letterSpacing: 1.5)
                    )
                  ),
                ),
              );
          } ,
          ),
          SizedBox(height: 60),
        ],
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
              "Reset Password",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter your new password and confirm it",
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
