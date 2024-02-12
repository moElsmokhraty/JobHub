import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/format_time.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/spacers/height_spacer.dart';
import '../../../../../../core/widgets/text_styles/app_style.dart';
import '../../../../../../core/widgets/text_styles/reusable_text.dart';
import 'message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/message.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/message_text_field.dart';

class ConversationViewBody extends StatelessWidget {
  const ConversationViewBody({
    super.key,
    required this.cubit,
    required this.state,
    required this.chat,
    required this.pages,
    required this.messages,
  });

  final ConversationCubit cubit;
  final ConversationState state;
  final Chat chat;
  final int pages;
  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationCubit, ConversationState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              state is GetAllMessagesLoading || state is SocketConnected
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        controller: cubit.scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
                            child: Column(
                              children: [
                                ReusableText(
                                  text: msgTime(messages[index].createdAt!),
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
                      ),
                    ),
              MessageTextField(
                cubit: cubit,
                chat: chat,
                state: state,
              ),
            ],
          ),
        );
      },
    );
  }
}
