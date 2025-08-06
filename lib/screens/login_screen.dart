import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/signup_scrren.dart'; 

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true; 
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset("images/doctor.png"),
              ),
              SizedBox(height: 10),
              _buildUsernameField(),
              _buildPasswordField(),
              SizedBox(height: 20),
              _buildLoginButton(context),
              SizedBox(height: 20),
              _buildSignUpPrompt(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Enter Username",
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: passwordController,
        obscureText: passToggle,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Enter Password",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                passToggle = !passToggle; 
              });
            },
            child: Icon(
              passToggle ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Material(
          color: Color(0xFF7165D6),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {
              
              print("Username: ${usernameController.text}, Password: ${passwordController.text}");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: Text(
            "Create Account",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7165D6),
            ),
          ),
        ),
      ],
    );
  }
}