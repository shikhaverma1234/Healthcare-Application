import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true; 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"), 
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Image.asset("images/doctors.png"),
                SizedBox(height: 15),
                _buildEmailField(),
                SizedBox(height: 10),
                _buildPasswordField(),
                SizedBox(height: 20),
                _buildCreateAccountButton(),
                SizedBox(height: 20),
                _buildLoginPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next, 
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: passToggle,
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
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
      textInputAction: TextInputAction.done, 
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Color(0xFF7165D6),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            
            print("Account created with email: ${emailController.text} and password: ${passwordController.text}");
            
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                "Create Account",
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
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
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
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text(
            "Log In",
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