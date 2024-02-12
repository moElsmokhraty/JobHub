import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.12,
      color: Color(kLight.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: userData.imageUrl ?? defaultImage,
                  width: 80.w,
                  height: 100.h,
                ),
              ),
              const WidthSpacer(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: userData.username!,
                    style: appStyle(20, Color(kDark.value), FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Color(kDarkGrey.value),
                      ),
                      const WidthSpacer(width: 5),
                      ReusableText(
                        text: userData.location!,
                        style: appStyle(
                            16, Color(kDarkGrey.value), FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRoutes.kUpdateUserView, extra: userData);
            },
            child: const Icon(
              Icons.mode_edit_rounded,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
