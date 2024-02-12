import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';

class ManageJobsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ManageJobsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      title: Text(
        'Manage Jobs',
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
      leading: IconButton(
        padding: EdgeInsets.all(8.h),
        onPressed: () {
          GoRouter.of(context).pushReplacement(AppRoutes.kAdminPanelView);
        },
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
    );
  }
}
