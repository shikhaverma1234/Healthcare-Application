import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/upcoming_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _buttonIndex = 0;

  final List<Widget> _scheduleWidgets = [
    UpcomingSchedule(), 
    Container(), 
    Container(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Schedule"), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Schedule",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildButtonBar(),
              SizedBox(height: 30),
              _scheduleWidgets[_buttonIndex],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBar() {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF4F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return _buildButton(index);
        }),
      ),
    );
  }

  Widget _buildButton(int index) {
    final titles = ["Upcoming", "Completed", "Canceled"];
    return InkWell(
      onTap: () {
        setState(() {
          _buttonIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        decoration: BoxDecoration(
          color: _buttonIndex == index ? Color(0xFF7165D6) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          titles[index],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _buttonIndex == index ? Colors.white : Colors.black38,
          ),
        ),
      ),
    );
  }
}