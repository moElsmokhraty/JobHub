import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:job_hub/features/home/data/models/job.dart';

class JobTile extends StatelessWidget {
  const JobTile({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRoutes.kJobDetailsView, extra: job);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          height: height * 0.15,
          width: width,
          color: Color(kLightGrey.value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(job.imageUrl!),
                  ),
                  const WidthSpacer(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: job.company!,
                        style: appStyle(
                          20,
                          Color(kDark.value),
                          FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: Text(
                          job.title!,
                          style: appStyle(
                            20,
                            Color(kDark.value),
                            FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(kOrange.value),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                    text: job.salary!,
                    style: appStyle(
                      22,
                      Color(kDark.value),
                      FontWeight.w600,
                    ),
                  ),
                  ReusableText(
                    text: '/${job.contract!}',
                    style: appStyle(
                      20,
                      Color(kDarkGrey.value),
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
