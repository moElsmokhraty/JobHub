import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/functions/format_time.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/get_all_messages_response.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/message_item.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.chatId,
    required this.pages,
    required this.response,
    required this.scrollController,
  });

  final GetAllMessagesResponse response;
  final String chatId;
  final int pages;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: response.messages!.length,
      itemBuilder: (context, index) {
        final message = response.messages![index];
        return Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
          child: Column(
            children: [
              ReusableText(
                text: msgTime(response.messages![index].createdAt!),
                style: appStyle(
                  12,
                  Color(kDark.value),
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(size: 15),
              MessageItem(
                senderId: message.sender!.id!,
                senderImage: message.sender!.imageUrl!,
                msgContent: message.content!,
              ),
            ],
          ),
        );
      },
    );
  }
}
