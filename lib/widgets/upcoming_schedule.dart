import 'package:flutter/material.dart';

class UpcomingSchedule extends StatelessWidget {
  const UpcomingSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    
    final schedules = List.generate(3, (index) => ScheduleData(
      doctorName: 'Dr. Smith',
      specialization: 'Cardiologist',
      date: '30/04/2025',
      time: '10:30 AM',
      status: 'Confirmed',
      imageAsset: 'images/doctor1.jpg',
    ));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Schedules",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          
          ...schedules.map((schedule) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _ScheduleCard(schedule: schedule),
          )),
        ],
      ),
    );
  }
}

class ScheduleData {
  final String doctorName;
  final String specialization;
  final String date;
  final String time;
  final String status;
  final String imageAsset;

  ScheduleData({
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.time,
    required this.status,
    required this.imageAsset,
  });
}

class _ScheduleCard extends StatelessWidget {
  final ScheduleData schedule;

  const _ScheduleCard({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor info row
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(schedule.imageAsset),
              ),
              title: Text(
                schedule.doctorName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(schedule.specialization),
            ),
            Divider(height: 25),
            // Date, Time, and Status Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoItem(
                  icon: Icons.calendar_today_outlined,
                  label: schedule.date,
                ),
                _InfoItem(
                  icon: Icons.access_time_outlined,
                  label: schedule.time,
                ),
                _StatusItem(status: schedule.status),
              ],
            ),
            SizedBox(height: 15),
            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  label: 'Cancel',
                  backgroundColor: Color(0xFFF4F6FA),
                  textColor: Colors.black,
                  onTap: () {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cancel tapped'))
                    );
                  },
                ),
                _ActionButton(
                  label: 'Reschedule',
                  backgroundColor: Color(0xFF7165D6),
                  textColor: Colors.white,
                  onTap: () {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Reschedule tapped'))
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54, size: 20),
        SizedBox(width: 6),
        Text(label, style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String status;

  const _StatusItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use green color for Confirmed, else gray
    final isConfirmed = status.toLowerCase() == 'confirmed';
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isConfirmed ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6),
        Text(status, style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}