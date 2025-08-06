import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  final List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7165D6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            _buildAppBar(context),
            _buildDoctorInfo(),
            _buildDoctorDetails(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 25),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white, size: 25),
            onPressed: () {
             
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage("images/doctor1.jpg"),
          ),
          SizedBox(height: 15),
          Text(
            "Dr. Subham",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            "Therapist",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCircleIcon(icon: Icons.call),
              SizedBox(width: 20),
              _buildCircleIcon(icon: CupertinoIcons.chat_bubble_text_fill),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon({required IconData icon}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0xFF9F97E2), shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 25),
    );
  }

  Widget _buildDoctorDetails(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      width: double.infinity,
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("About Doctor"),
          Text(
            "A healthcare professional who uses therapy, a treatment approach, to help individuals improve their mental and/or physical health. ",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          SizedBox(height: 20),
          _buildReviewsSection(),
          SizedBox(height: 20),
          _buildReviewsList(),
          SizedBox(height: 15),
          _buildSectionTitle("Location"),
          _buildLocationTile(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildReviewsSection() {
    return Row(
      children: [
        Text("Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        SizedBox(width: 10),
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 3),
        Text("4.9", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        SizedBox(width: 5),
        Text("(124)", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF7165D6))),
        Spacer(),
        TextButton(
          onPressed: () {
            
          },
          child: Text(
            "See all",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF7165D6)),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsList() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imgs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/${imgs[index]}"),
                    ),
                    title: Text("Dr. Smith", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("1 day ago"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 4),
                        Text("4.9", style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Many thanks to Dr. Smith.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLocationTile() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Color(0xFFF0EEFA), shape: BoxShape.circle),
        child: Icon(Icons.location_on, color: Color(0xFF7165D6), size: 30),
      ),
      title: Text("New York, Medical Center", style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Address line of the medical center"),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Consultation Price", style: TextStyle(color: Colors.black54)),
              Text("\$100", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
            ],
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(color: Color(0xFF7165D6), borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Book Appointment",
                  style: TextStyle(color: Colors.white, fontSize: 18,  
                  fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}