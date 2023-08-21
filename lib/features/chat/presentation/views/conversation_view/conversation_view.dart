import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/conversation_view_body.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/conversation_view_app_bar.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    ConversationCubit cubit = BlocProvider.of(context);
    return BlocConsumer<ConversationCubit, ConversationState>(
      listener: (context, state) {
      if (state is GetAllMessagesSuccess){
        //cubit.scrollController.jumpTo(cubit.scrollController.position.maxScrollExtent);
      }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: ConversationViewAppBar(
              chat: chat,
              leave: () {
                cubit.disconnect(chat.id!);
                GoRouter.of(context).pop();
              },
            ),
          ),
          body: SafeArea(
            child: ConversationViewBody(
              chat: chat,
              cubit: cubit,
              state: state,
            ),
          ),
        );
      },
    );
  }
}
