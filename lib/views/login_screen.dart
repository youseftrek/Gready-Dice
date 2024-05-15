import 'package:flutter/material.dart';
import 'package:greedy_dice_project/widgets/Signup_Textfield.dart';
import 'package:greedy_dice_project/widgets/Signup_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {}

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: screenSize.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  // Logo
                  Image.asset('assets/images/dice.png'),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  // Welcome back text
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      color: Color(0xffEEEEEE),
                      fontSize: screenSize.width * 0.05,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  // Username text field
                  Signup_Textfield(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  // Password text field
                  Signup_Textfield(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forget Password ?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  // Sign button
                  Signup_button(
                    onTap: login,
                    label: "Login",
                  ),
                  SizedBox(height: screenSize.height * 0.1),
                  // Not a member? Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Register now',
                        style: TextStyle(color: Color(0xff00ADB5)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
