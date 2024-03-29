import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_request.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    super.key,
    required this.cubit,
    required this.chat,
    required this.state,
  });

  final Chat chat;
  final ConversationCubit cubit;
  final ConversationState state;

  @override
  Widget build(BuildContext context) {
    String receiverId =
        chat.users![0].id! == userId ? chat.users![1].id! : chat.users![0].id!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
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
              cubit.sendMessage(
                SendMessageRequest(
                  content: cubit.msgController.text,
                  chatId: chat.id!,
                  receiverId: receiverId,
                ),
              ).then((value) async {
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
    );
  }
}
