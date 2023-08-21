import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';

class MessageItem extends StatelessWidget {
  const MessageItem(
      {super.key,
      required this.senderId,
      required this.senderImage,
      required this.msgContent});

  final String senderId;
  final String senderImage;
  final String msgContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          senderId == userId ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: senderId == userId
          ? [
              ChatBubble(
                alignment: senderId == userId
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                backGroundColor: senderId == userId
                    ? Color(kOrange.value)
                    : Color(kLightBlue.value),
                elevation: 0,
                clipper: ChatBubbleClipper4(
                  radius: 8,
                  type: senderId == userId
                      ? BubbleType.sendBubble
                      : BubbleType.receiverBubble,
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.8,
                  ),
                  child: ReusableText(
                    text: msgContent,
                    style: appStyle(
                      14,
                      Color(kLight.value),
                      FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const WidthSpacer(width: 5),
              CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider(
                  senderImage,
                ),
              ),
            ]
          : [
              CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider(
                  senderImage,
                ),
              ),
              const WidthSpacer(width: 5),
              ChatBubble(
                alignment: senderId == userId
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                backGroundColor: senderId == userId
                    ? Color(kOrange.value)
                    : Color(kLightBlue.value),
                elevation: 0,
                clipper: ChatBubbleClipper4(
                  radius: 8,
                  type: senderId == userId
                      ? BubbleType.sendBubble
                      : BubbleType.receiverBubble,
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.8,
                  ),
                  child: ReusableText(
                    text: msgContent,
                    style: appStyle(
                      14,
                      Color(kLight.value),
                      FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
    );
  }
}
