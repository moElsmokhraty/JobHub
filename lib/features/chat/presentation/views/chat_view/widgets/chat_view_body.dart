import 'chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/states/empty_list_state.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is GetAllChatsError) {
          return CustomErrorWidget(message: 'Error: ${state.errMessage}');
        } else if (state is GetAllChatsSuccess) {
          if (state.response.chats!.isEmpty) {
            return const EmptyListWidget(text: 'No chats Available');
          } else {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
              physics: const BouncingScrollPhysics(),
              itemCount: state.response.chats!.length,
              itemBuilder: (context, index) {
                return ChatItem(chat: state.response.chats![index]);
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
