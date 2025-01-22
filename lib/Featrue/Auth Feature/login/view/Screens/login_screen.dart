import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ls/Featrue/MainLayout/view/MainLayOut.dart';
import 'package:ls/Featrue/MainLayout/view/Profile/view_model/profile_cubit.dart';

import '../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../ForgetPassword/View/Screens/ForgetPasswordScreen/ForgetPassword_Screen.dart';
import '../../view_mode/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  _buildForgetButton(),
                  const SizedBox(height: 15),
                  BlocConsumer<LoginCubit,LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  MainLayout()),
                                  (Route<dynamic> route) => false);
                          ScaffoldMessenger.of(context).
                          showSnackBar(
                            SnackBar(content: Text('Successfully logged in')),
                          );
                        }  if (state is LoginErrorState){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Incorrect email or password'))
                          );
                        }
                      },
                    builder:(context,state) {
                        var cubit = LoginCubit.get(context);
                       return Center(
                          child: GestureDetector(
                            onTap: () async {

                              await cubit.userLogin(
                                  mail: emailController.text,
                                  password: passwordController.text, context: context);
                             await ProfileCubit.get(context).myProfile();
                            },
                            child: Container(
                              height: 50,
                              width: screenWidth * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kFirstColor,
                              ),
                              child:  Center(
                                child : state is LoginLoadingState
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                    },


                      ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgetButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.to(() => ForgetPasswordScreen());
        },
        child: const Text(
          "Forget Password?",
          style: TextStyle(color: Colors.white, fontSize: 20),
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
          const SizedBox(height: 20),
          _buildInputLabel("Password"),
          _buildPasswordField(),
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

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: !_isPasswordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "*******",
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
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
                    "Sign In",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Train and live the new experience of exercising at home",
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
          image: AssetImage("assets/images/17.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
