import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class RecentlyPostedItem extends StatelessWidget {
  const RecentlyPostedItem({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoutes.kJobDetailsView,
          extra: job,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Color(kLightGrey.value),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: job.imageUrl!,
                  height: 40.h,
                  width: 50.w,
                ),
                const WidthSpacer(width: 15),
                SizedBox(
                  width: width * 0.6,
                  child: ReusableText(
                    text: job.company!,
                    style: appStyle(
                      20,
                      Color(kDark.value),
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const HeightSpacer(size: 10),
            ReusableText(
              text: job.title!,
              style: appStyle(
                20,
                Color(kDark.value),
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(size: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: job.location!,
                  style: appStyle(
                    16,
                    Color(kDarkGrey.value),
                    FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  radius: 15.h,
                  child: Icon(
                    Ionicons.chevron_forward,
                    color: Colors.black,
                    size: 20.w,
                  ),
                ),
              ],
            ),
            const HeightSpacer(size: 15),
            ReusableText(
              text: job.salary!,
              style: appStyle(
                20,
                Color(kDark.value),
                FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
