import 'package:flutter/material.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';

import 'messages_list_view.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({
    super.key,
    required this.state,
    required this.chatId,
    required this.pages,
    required this.scrollController,
  });

  final ConversationState state;
  final String chatId;
  final int pages;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    if (state is GetAllMessagesSuccess) {
      return Expanded(
        child: MessagesListView(
          scrollController: scrollController,
          chatId: chatId,
          pages: pages,
          response: (state as GetAllMessagesSuccess).response,
        ),
      );
    } else if (state is GetAllMessagesFailure) {
      return Expanded(
        child: CustomErrorWidget(message: (state as GetAllMessagesFailure).errMessage),
      );
    } else {
      return const Expanded(
        child: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
