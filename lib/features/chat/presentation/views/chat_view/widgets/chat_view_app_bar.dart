import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/features/main/presentation/views/widgets/leading_button.dart';

class ChatViewAppBar extends StatelessWidget {
  const ChatViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Chats',
      actions: [
        Padding(
          padding: EdgeInsets.all(
            12.h,
          ),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: CachedNetworkImageProvider(userImage!),
          ),
        ),
      ],
      leading: Padding(
        padding: EdgeInsets.all(12.h),
        child: const LeadingButton(),
      ),
    );
  }
}
