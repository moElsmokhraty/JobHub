import '../../../../../../core/widgets/job_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';

class UpdateJobAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpdateJobAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    MediaCubit cubit = BlocProvider.of(context);
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      backgroundColor: Color(kLight.value),
      title: Text(
        'Update Job',
        style: appStyle(
          16,
          Color(kDark.value),
          FontWeight.w600,
        ),
      ),
      actions: [JobImage(cubit: cubit)],
      leading: IconButton(
        padding: EdgeInsets.all(8.h),
        onPressed: () {
          GoRouter.of(context).pushReplacement(AppRoutes.kManageJobsView);
        },
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
    );
  }
}
