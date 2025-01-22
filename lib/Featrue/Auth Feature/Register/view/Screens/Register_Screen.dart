import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/AgeSelection.dart';

import '../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../AuthType/View/AuthType.dart';
import '../../../goals/View/First_Goal_Screen.dart';
import '../../../login/view/Screens/login_screen.dart';
import '../../view_model/regester_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLoginForm(screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.02),
                    _buildActionButtons(screenWidth, screenHeight),
                    _buildSocialLoginIcons(screenWidth, screenHeight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputLabel("Name", screenWidth),
        _buildTextField(
            hintText: "Enter Your Name",
            controller: nameController,
            screenWidth: screenWidth),
        SizedBox(height: screenHeight * 0.02),
        _buildInputLabel("Email", screenWidth),
        _buildTextField(
          hintText: "Enter Your Email",
          controller: emailController,
          screenWidth: screenWidth,
          validator: (value) {
            if (value == null || value.isEmpty || !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        SizedBox(height: screenHeight * 0.02),
        _buildInputLabel("Phone", screenWidth),
        _buildTextField(
          hintText: "Enter Your Phone Number",
          controller: phoneController,
          screenWidth: screenWidth,
          validator: (value) {
            if (value == null || value.isEmpty || value.length != 10) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
        ),
        SizedBox(height: screenHeight * 0.02),
        _buildInputLabel("Password", screenWidth),
        _buildPasswordField(
          controller: passwordController,
          obscureText: _obscurePassword,
          screenWidth: screenWidth,
          onToggleVisibility: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        SizedBox(height: screenHeight * 0.02),
        _buildInputLabel("Confirm Password", screenWidth),
        _buildPasswordField(
          controller: confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          screenWidth: screenWidth,
          onToggleVisibility: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
          validator: (value) {
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildInputLabel(String label, double screenWidth) {
    return Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required double screenWidth,
    bool obscureText = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    required double screenWidth,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      validator: validator,
      decoration: InputDecoration(
        hintText: "*******",
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: onToggleVisibility,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildActionButtons(double screenWidth, double screenHeight) {
    return Column(
      children: [
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (passwordController.text == confirmPasswordController.text) {
              if (state is RegisterSuccessState) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  AuthType()),
                        (Route<dynamic> route) => false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Account successfully created')),
                );
              }  else if (state is RegisterErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message),
                  ));
              }
            }
          },
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);

            return Center(
              child: GestureDetector(
                onTap: () async {
                  await cubit.userRegister(
                    username: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                  );
                },
                child: Container(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kThirdColor,
                  ),
                  child: Center(
                    child: state is RegisterLoadingState
                        ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        SizedBox(height: screenHeight * 0.02),

        GestureDetector(
          onTap: () {
            Get.to(() => LoginView());
          },
          child: Text(
            "Already Have an Account?",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildActionButton({
    required String text,
    required double screenWidth,
    required double screenHeight,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: screenHeight * 0.07,
        width: screenWidth * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginIcons(double screenWidth, double screenHeight) {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.facebook, color: Colors.white, size: screenWidth * 0.1),
            SizedBox(width: screenWidth * 0.05),
            Icon(Icons.g_mobiledata, color: Colors.white, size: screenWidth * 0.1),
            SizedBox(width: screenWidth * 0.05),
            Icon(Icons.apple, color: Colors.white, size: screenWidth * 0.1),
          ],
        ),
      ],
    );
  }

  Widget _buildTitleSubtitle(double screenWidth, double screenHeight) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black54, Colors.transparent],
        ),
      ),
      height: screenHeight * 0.55,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            RichText(
              text: TextSpan(
                text: 'HARD\t',
                style: TextStyle(
                  fontFamily: "Bebas",
                  fontSize: screenWidth * 0.08,
                  letterSpacing: 5,
                ),
                children: const [
                  TextSpan(
                    text: 'ELEMENT',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SignUp",
                    style: TextStyle(
                      fontSize: screenWidth * 0.1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Train and live the new experience of exercising at home",
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.55,
      child: Image.asset(
        'assets/images/12.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
