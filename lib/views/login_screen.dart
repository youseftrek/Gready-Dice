import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greedy_dice_project/widgets/Signup_Textfield.dart';
import 'package:greedy_dice_project/widgets/Signup_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
              ),
              //   logo
              Icon(
                Icons.lock,
                size: 150,
                color: Colors.white,
              ),
              SizedBox(
                height: 50,
              ),
              //   welcome back text
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                  color: Color(0xffEEEEEE),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 75,
              ),
              //   username text field
              Signup_Textfield(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
              SizedBox(
                height: 25,
              ),
              //   password text field
              Signup_Textfield(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                height: 20,
              ),
              //   sign button
              Signup_button(onTap: login,label: "Login",),
              SizedBox(height: 100),
              //   not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                      style: TextStyle(color: Colors.grey)),
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
    );
  }
}
