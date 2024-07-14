import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? AppColors.SECONDARYCOLOR : Colors.grey[300],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isUser ?  10:0),
              bottomRight: const Radius.circular(10),
              bottomLeft: const Radius.circular(10),
              topRight: Radius.circular(!isUser ? 10: 0)),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
