import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/user_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';

class UpdateUserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpdateUserAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      backgroundColor: Color(kLight.value),
      title: Text(
        'Update User',
        style: appStyle(
          16,
          Color(kDark.value),
          FontWeight.w600,
        ),
      ),
      actions: const [UserImage()],
      leading: IconButton(
        padding: EdgeInsets.all(8.h),
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
    );
  }
}
