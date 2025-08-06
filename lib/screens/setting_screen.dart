import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Settings"), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 30),
              _buildProfileTile(),
              Divider(height: 50),
              _buildSettingsOption(
                context,
                icon: CupertinoIcons.person,
                title: "Profile",
                color: Colors.blue,
                onTap: () {
                  
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.notifications_none_outlined,
                title: "Notifications",
                color: Colors.deepPurple,
                onTap: () {
                  
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.privacy_tip_outlined,
                title: "Privacy",
                color: Colors.indigo,
                onTap: () {
                  
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.settings_suggest_outlined,
                title: "General",
                color: Colors.green,
                onTap: () {
                  
                },
              ),
              _buildSettingsOption(
                context,
                icon: Icons.info_outline_rounded,
                title: "About Us",
                color: Colors.orange,
                onTap: () {
                  
                },
              ),
              Divider(height: 40),
              _buildLogoutOption(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      "Settings",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }


 Widget _buildProfileTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("images/doctor1.jpg"),
      ),
      title: Text(
        "Dr. Swati",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          color: Colors.black54,
        ),
      ),
      subtitle: Text("Profile"),
    );
  }


  Widget _buildSettingsOption(BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: color,
          size: 35,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Widget _buildLogoutOption(BuildContext context) {
    return ListTile(
      onTap: () {
        
      },
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.redAccent.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.logout,
          color: Colors.redAccent,
          size: 35,
        ),
      ),
      title: Text(
        "Log out",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.redAccent,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      
    );
  }
}

extension on Color {
  get shade100 => null;
}