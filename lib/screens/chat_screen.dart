import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/chat_sample.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color(0xFF7165D6),
          leadingWidth: 30,
          title: _buildAppBarTitle(),
          actions: _buildAppBarActions(),
        ),
      ),
      body: _buildChatList(),
      bottomSheet: _buildMessageInput(context),
    );
  }

  Widget _buildAppBarTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("images/doctor1.jpg"),
          ),
          SizedBox(width: 10),
          Text(
            "Dr. John",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: Icon(Icons.call, color: Colors.white, size: 26),
        onPressed: () {
         
        },
      ),
      IconButton(
        icon: Icon(Icons.video_call, color: Colors.white, size: 30),
        onPressed: () {
          
        },
      ),
      IconButton(
        icon: Icon(Icons.more_vert, color: Colors.white, size: 26),
        onPressed: () {
          
        },
      ),
    ];
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 80),
      itemBuilder: (context, index) => ChatSample(),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add, size: 30),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.emoji_emotions_outlined, color: Colors.amber, size: 30),
            onPressed: () {
              Flexible(
                child: Container(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Add your emoji picker here
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Type something",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  filled: true,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, size: 30, color: Color(0xFF7165D6)),
            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }
}