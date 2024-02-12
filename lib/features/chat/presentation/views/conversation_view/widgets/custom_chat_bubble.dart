import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({
    super.key,
    required this.isMe,
    required this.msgContent,
  });

  final bool isMe;
  final String msgContent;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      backGroundColor: isMe ? Color(kOrange.value) : Color(kLightBlue.value),
      elevation: 0,
      clipper: ChatBubbleClipper10(
        radius: 8,
        type: isMe ? BubbleType.sendBubble : BubbleType.receiverBubble,
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: width * 0.8),
        child: ReusableText(
          text: msgContent,
          style: appStyle(
            14,
            Color(kLight.value),
            FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
