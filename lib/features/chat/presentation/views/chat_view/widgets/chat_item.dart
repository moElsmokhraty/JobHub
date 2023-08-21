import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/functions/format_time.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoutes.kConversationView,
          extra: chat,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Container(
          height: height * 0.13,
          width: width,
          decoration: BoxDecoration(
            color: Color(kLightGrey.value),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 10.h,
            ),
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            leading: CircleAvatar(
              radius: 30,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: chat.users![1].imageUrl!,
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: chat.users![1].username!,
                  style: appStyle(
                    15,
                    Color(kDark.value),
                    FontWeight.w600,
                  ),
                ),
                const HeightSpacer(size: 5),
                ReusableText(
                  text: chat.latestMessage?.content! ?? 'Start Conversation!',
                  style: appStyle(
                    15,
                    Color(kDark.value),
                    FontWeight.normal,
                  ),
                ),
              ],
            ),
            trailing: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ReusableText(
                    text: msgTime(chat.updatedAt!),
                    style: appStyle(15, Color(kDark.value), FontWeight.w500),
                  ),
                  const HeightSpacer(size: 5),
                  chat.latestMessage?.sender!.id! == null
                      ? const SizedBox.shrink()
                      : chat.latestMessage?.sender!.id! == userId
                          ? const Icon(
                              size: 22,
                              Ionicons.arrow_forward_circle_outline,
                            )
                          : const Icon(
                              size: 22,
                              Ionicons.arrow_back_circle_outline,
                            ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
