import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';

class ConversationViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationViewAppBar({
    super.key,
    this.leave,
    required this.chat,
    required this.isTyping,
    required this.isOnline,
  });

  final Chat chat;
  final bool isTyping;
  final bool isOnline;
  final void Function()? leave;

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    UserData receiver =
        chat.users![0].id! == userId ? chat.users![1] : chat.users![0];
    return AppBar(
      title: Column(
        children: [
          const HeightSpacer(size: 10),
          Text(
            receiver.username!,
            style: appStyle(
              16,
              Color(kDark.value),
              FontWeight.w600,
            ),
          ),
          isTyping
              ? Text(
                  'typing...',
                  style: appStyle(
                    14,
                    Color(kDarkGrey.value),
                    FontWeight.w500,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      actions: [
        Padding(
          padding: EdgeInsets.all(12.h),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider(receiver.imageUrl!),
              ),
              isOnline
                  ? const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                    )
                  : const SizedBox.shrink(),
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
