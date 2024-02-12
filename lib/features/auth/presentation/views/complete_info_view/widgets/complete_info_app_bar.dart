import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/user_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class CompleteInfoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CompleteInfoAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ReusableText(
        text: 'Complete Info',
        style: appStyle(20, Color(kDark.value), FontWeight.bold),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () =>
            GoRouter.of(context).pushReplacement(AppRoutes.kRegisterView),
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Color(kDark.value),
        ),
      ),
      actions: const [UserImage()],
    );
  }
}
