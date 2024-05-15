import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';
import 'package:greedy_dice_project/widgets/Signup_Textfield.dart';
import 'package:greedy_dice_project/widgets/Signup_button.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  // Text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  // Dio HTTP Requests
  // Helper Functions
  void signupUser() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF222831),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          // logo top left corner
          const Icon(
            Icons.lock,
            size: 100,
          ),
          const SizedBox(
            height: 50,
          ),
          // Registration Title
          const Text(
            'Registration',
            style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 24),
          ),
          const SizedBox(
            height: 50,
          ),
          // Name Text-field
          Signup_Textfield(
            controller: nameController,
            hintText: 'Name',
            obscureText: false,
          ),
          const SizedBox(
            height: 25,
          ),
          // Email TextField
          Signup_Textfield(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(
            height: 25,
          ),
          // Password and Confirm Password TextFields
          Signup_Textfield(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 25,
          ),
          Signup_Textfield(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: true,
          ),
          // Sign Up Button
          const SizedBox(
            height: 45,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Signup_button(
              onTap: APIServiceModel.getUsersList,
              label: "SignUp",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member?', style: TextStyle(color: Color(0xFFEEEEEE))),
              SizedBox(
                width: 4,
              ),
              Text(
                'Register now',
                style: TextStyle(
                    color: Color(0xFF00ADB5), fontWeight: FontWeight.bold),
              )
            ],
          )
          // Have account ? link to sign in page
        ],
      ),
    );
  }
}
