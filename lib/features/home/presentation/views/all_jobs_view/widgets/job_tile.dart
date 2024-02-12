import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:job_hub/features/home/data/models/job.dart';

class JobTile extends StatelessWidget {
  const JobTile({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kJobDetailsView, extra: job);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(kLightGrey.value),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: CachedNetworkImageProvider(job.imageUrl!),
            ),
            const WidthSpacer(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: job.title!,
                    style: appStyle(
                      20,
                      Color(kDark.value),
                      FontWeight.w600,
                    ).copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  ReusableText(
                    text: job.company!,
                    style: appStyle(
                      18,
                      Color(kDark.value),
                      FontWeight.w500,
                    ).copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  const HeightSpacer(size: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.6,
                        child: ReusableText(
                          text: job.salary!,
                          style: appStyle(
                            18,
                            Color(kDark.value),
                            FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const WidthSpacer(width: 2),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Color(kOrange.value),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
