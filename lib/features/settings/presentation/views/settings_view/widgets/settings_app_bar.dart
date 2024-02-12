import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/features/drawer/presentation/views/widgets/leading_button.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Settings',
        style: appStyle(
          16,
          Color(kDark.value),
          FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(12.h),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: CachedNetworkImageProvider(userImage!),
          ),
        ),
      ],
      leading: const LeadingButton(),
    );
  }
}
