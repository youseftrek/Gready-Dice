import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';
import 'package:greedy_dice_project/widgets/Signup_Textfield.dart';
import 'package:greedy_dice_project/widgets/Signup_button.dart';

import '../models/user_model.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signupUser() {
    // Implement signup functionality here
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF222831),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Image.asset('assets/images/dice.png',height: screenSize.height * 0.18,),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Text(
              'Registration',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Signup_Textfield(
              controller: nameController,
              hintText: 'Name',
              obscureText: false,
            ),
            SizedBox(
              height: screenSize.height * 0.025,
            ),
            Signup_Textfield(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            SizedBox(
              height: screenSize.height * 0.025,
            ),
            Signup_Textfield(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(
              height: screenSize.height * 0.025,
            ),
            Signup_Textfield(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
              child: Signup_button(
                onTap: () async {
                  // Handle signup button tap
                  APIServiceModel.putUserStatus(1,true);
                },
                label: "SignUp",
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.025,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have Account?',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Login now',
                  style: TextStyle(
                    color: Color(0xFF00ADB5),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
