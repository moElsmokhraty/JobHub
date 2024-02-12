import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/custom_chat_bubble.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.senderId,
    required this.senderImage,
    required this.msgContent,
  });

  final String senderId;
  final String senderImage;
  final String msgContent;

  @override
  Widget build(BuildContext context) {
    bool isMe = senderId == userId;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: isMe
          ? [
              CustomChatBubble(isMe: isMe, msgContent: msgContent),
              const WidthSpacer(width: 5),
              CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider(senderImage),
              ),
            ]
          : [
              CircleAvatar(
                  radius: 15,
                  backgroundImage: CachedNetworkImageProvider(senderImage)),
              const WidthSpacer(width: 5),
              CustomChatBubble(isMe: isMe, msgContent: msgContent),
            ],
    );
  }
}
