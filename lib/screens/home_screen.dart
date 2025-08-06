import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/appointment_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> symptoms = [
    "Temperature",
    "Runny Nose",
    "Fever",
    "Cough",
    "Cold",
  ];

  final List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with greeting and avatar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello Alex",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("images/doctor1.jpg"),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Action buttons: Clinic Visit and Home Visit
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  backgroundColor: Color(0xFF7165D6),
                  iconData: Icons.add,
                  title: "Clinic Visit",
                  subtitle: "Make an appointment",
                  iconColor: Color(0xFF7165D6),
                  textColor: Colors.white,
                  subTextColor: Colors.white70,
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppointmentScreen()),
                    );
                  },
                ),
                _buildActionButton(
                  context,
                  backgroundColor: Colors.white,
                  iconData: Icons.home_filled,
                  title: "Home Visit",
                  subtitle: "Call the doctor home",
                  iconColor: Color(0xFF7165D6),
                  textColor: Colors.black,
                  subTextColor: Colors.black54,
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppointmentScreen()),
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "What are your symptoms?",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),

          SizedBox(
            height: 70,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: symptoms.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F6FA),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    symptoms[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 15),

          
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Popular Doctors",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),

         
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: imgs.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildDoctorCard(context, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required Color backgroundColor,
    required IconData iconData,
    required String title,
    required String subtitle,
    required Color iconColor,
    required Color textColor,
    required Color subTextColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  color: iconColor,
                  size: 35,
                ),
              ),
              SizedBox(height: 30),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(
                  color: subTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppointmentScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("images/${imgs[index]}"),
            ),
            Text(
              "Dr. Subham",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Text(
              "Therapist",
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  "4.9",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}