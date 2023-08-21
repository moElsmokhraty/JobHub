import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';

class ConversationViewAppBar extends StatelessWidget {
  const ConversationViewAppBar(
      {super.key, required this.chat, this.leave});

  final Chat chat;
  final void Function()? leave;


  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: chat.users![0].id! == userId
          ? chat.users![1].username!
          : chat.users![0].username!,
      actions: [
        Padding(
          padding: EdgeInsets.all(
            12.h,
          ),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider(
                  chat.users![0].id! == userId
                      ? chat.users![1].imageUrl!
                      : chat.users![0].imageUrl!,
                ),
              ),
              const Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
      leading: Padding(
        padding: EdgeInsets.all(12.h),
        child: GestureDetector(
          onTap: leave,
          child: const Icon(CupertinoIcons.arrow_left),
        ),
      ),
    );
  }
}
