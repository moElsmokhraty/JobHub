import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_request.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/message_text_field.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/messages_body.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/messages_list_view.dart';

class ConversationViewBody extends StatelessWidget {
  const ConversationViewBody({
    super.key,
    required this.cubit,
    required this.state,
    required this.chat,
  });

  final ConversationCubit cubit;
  final ConversationState state;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          MessagesBody(
            scrollController: cubit.scrollController,
            state: state,
            chatId: chat.id!,
            pages: cubit.pages,
          ),
          MessageTextField(
            cubit: cubit,
            chat: chat,
          ),
        ],
      ),
    );
  }
}
