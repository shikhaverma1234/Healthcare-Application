import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
 
import 'package:flutter_application_1/screens/signup_scrren.dart';
import 'package:flutter_application_1/widgets/navbar_root.dart';  

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, 
        height: double.infinity, 
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 15),
            _buildSkipButton(context),
            SizedBox(height: 50),
            _buildImage(),
            SizedBox(height: 50),
            _buildTitle(),
            SizedBox(height: 10),
            _buildSubtitle(),
            SizedBox(height: 10),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavBarRoots()),
          );
        },
        child: Text(
          "SKIP",
          style: TextStyle(
            color: Color(0xFF7165D6),
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Image.asset(
        "images/doctors.png",
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Text('Image not found', style: TextStyle(color: Colors.red));
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Doctors Appointment",
      style: TextStyle(
        color: Color(0xFF7165D6),
        fontSize: 35,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        wordSpacing: 2,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Appoint your Doctor",
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        wordSpacing: 2,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(context, "Log In", LoginScreen()),
        _buildActionButton(context, "Sign Up", SignUpScreen()),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String title, Widget screen) {
    return Material(
      color: Color(0xFF7165D6),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}