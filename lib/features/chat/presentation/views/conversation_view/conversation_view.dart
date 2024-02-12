import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/functions/format_time.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/message.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_request.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/message_item.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/widgets/conversation_view_app_bar.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    List<Message> messages = [];
    ConversationCubit cubit = BlocProvider.of(context);
    String receiverId =
        chat.users![0].id! == userId ? chat.users![1].id! : chat.users![0].id!;
    return BlocConsumer<ConversationCubit, ConversationState>(
      listener: (context, state) {
        if (state is SendMessageSuccess) {
          cubit.scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Scaffold(
            appBar: ConversationViewAppBar(
              chat: chat,
              isTyping: cubit.isTyping,
              isOnline: cubit.isOnline,
              leave: () {
                cubit.disconnect(chat.id!);
                GoRouter.of(context).pop();
              },
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  (state is GetAllMessagesLoading || state is SocketConnected)
                      ? const Expanded(
                          child: Center(child: CircularProgressIndicator()))
                      : Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            reverse: true,
                            controller: cubit.scrollController,
                            itemCount: cubit.messages.length,
                            itemBuilder: (context, index) {
                              final message = cubit.messages[index];
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: 8.h, bottom: 12.h),
                                child: Column(
                                  children: [
                                    ReusableText(
                                      text: msgTime(
                                          cubit.messages[index].createdAt!),
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(kLight.value),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      cursorColor: Color(kDark.value),
                      controller: cubit.msgController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          cubit.sendTypingEvent(chat.id!);
                        } else {
                          cubit.sendStopTypingEvent(chat.id!);
                        }
                      },
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      keyboardType: TextInputType.multiline,
                      style: appStyle(
                        16,
                        Color(kDark.value),
                        FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(6.h),
                        filled: true,
                        fillColor: Color(kLight.value),
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            if (cubit.msgController.text.isEmpty) {
                              return;
                            }
                            FocusManager.instance.primaryFocus!.unfocus();
                            cubit
                                .sendMessage(
                              SendMessageRequest(
                                content: cubit.msgController.text,
                                chatId: chat.id!,
                                receiverId: receiverId,
                              ),
                            )
                                .then((value) async {
                              cubit.sendStopTypingEvent(chat.id!);
                              cubit.msgController.clear();
                              await cubit.getAllMessages(chatId: chat.id!);
                            });
                          },
                          child: Icon(
                            Icons.send_outlined,
                            size: 24,
                            color: Color(kLightBlue.value),
                          ),
                        ),
                        hintText: 'Type your Message...',
                        hintStyle: appStyle(
                          14,
                          Color(kDarkGrey.value),
                          FontWeight.normal,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.h)),
                          borderSide: BorderSide(color: Color(kDark.value)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.h)),
                          borderSide: BorderSide(color: Color(kDarkGrey.value)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
