import 'package:flutter/material.dart';

class UpperNipMessageClipper extends CustomClipper<Path> {
  final MessageType messageType;

  UpperNipMessageClipper(this.messageType);

  @override
  Path getClip(Size size) {
    final path = Path();
    if (messageType == MessageType.receive) {
      path.lineTo(size.width - 10, 0);
      path.lineTo(size.width, 10);
      path.lineTo(size.width - 10, 20);
    } else {
      path.lineTo(10, 0);
      path.lineTo(0, 10);
      path.lineTo(10, 20);
    }
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

enum MessageType {
  send,
  receive,
}

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildReceivedMessage(),
        _buildSentMessage(),
      ],
    );
  }

  Widget _buildReceivedMessage() {
    return Padding(
      padding: EdgeInsets.only(right: 80),
      child: ClipPath(
        clipper: UpperNipMessageClipper(MessageType.receive),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFE1E1E2),
            borderRadius: BorderRadius.circular(10), 
          ),
          child: Text(
            "Hello, what can I do for you? You can book an appointment directly.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSentMessage() {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
        decoration: BoxDecoration(
          color: Color(0xFF7165D6),
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Text(
          "Hello Doctor, are you there?",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}