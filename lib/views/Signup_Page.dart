import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';
import 'package:greedy_dice_project/views/login_screen.dart';
import 'package:greedy_dice_project/widgets/Signup_Textfield.dart';
import 'package:greedy_dice_project/widgets/Signup_button.dart';
import '../models/user_model.dart';
import '../widgets/utils.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signupUser() {
    // Implement signup functionality here
    bool validEmail = Utils.isValidEmail(emailController.text);
    bool validPassword = Utils.confirmPassword(
        passwordController.text, confirmPasswordController.text);
    if (validPassword && validEmail) {
      Random random = Random();
      int randomNumber = random.nextInt(50) + 1;
      User user = User(
          email: emailController.text,
          name: nameController.text,
          score: 0,
          avatar: "https://i.pravatar.cc/500?img=$randomNumber",
          password: passwordController.text);
      APIServiceModel.createNewUser(user);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      if (!validEmail) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email'), // Message to display
            duration: Duration(
                seconds: 2), // Duration for which the message will be displayed
          ),
        );
      } else if (!validPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords don\'t match'), // Message to display
            duration: Duration(
                seconds: 2), // Duration for which the message will be displayed
          ),
        );
      }
    }
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
            Image.asset(
              'assets/images/dice.png',
              height: screenSize.height * 0.18,
            ),
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
                onTap: signupUser,
                label: "SignUp",
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Have Account?',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                      color: Color(0xFF00ADB5),
                      fontWeight: FontWeight.bold,
                    ),
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
