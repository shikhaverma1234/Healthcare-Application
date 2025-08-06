import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  final List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Messages",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 25),
            _buildSectionTitle("Active Now"),
            SizedBox(height: 10),
            _buildActiveUsers(),
            SizedBox(height: 25),
            _buildSectionTitle("Recent Chat"),
            SizedBox(height: 10),
            _buildRecentChats(context),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Color(0xFF7165D6)),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildActiveUsers() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imgs.length,
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage("images/${imgs[index]}"),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRecentChats(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: imgs.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[300],
          indent: 75,
          endIndent: 20,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("images/${imgs[index]}"),
            ),
            title: Text(
              "Dr. John",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              "Hello, Doctor are you there?",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            trailing: Text(
              "12:00",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
