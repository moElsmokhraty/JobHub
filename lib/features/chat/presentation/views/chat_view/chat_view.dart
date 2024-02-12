import 'package:flutter/material.dart';
import 'package:job_hub/features/chat/presentation/views/chat_view/widgets/chat_view_app_bar.dart';
import 'package:job_hub/features/chat/presentation/views/chat_view/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        appBar: ChatViewAppBar(),
        body: ChatViewBody(),
      ),
    );
  }
}
