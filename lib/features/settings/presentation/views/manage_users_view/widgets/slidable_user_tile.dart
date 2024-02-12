import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/settings/presentation/cubits/manage_users_cubit/manage_users_cubit.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/widgets/dismissible_container.dart';
import 'package:job_hub/features/settings/presentation/views/manage_users_view/widgets/delete_user_alert_dialog.dart';

class SlidableUserTile extends StatelessWidget {
  const SlidableUserTile({
    super.key,
    required this.userData,
    required this.cubit,
  });

  final UserData userData;
  final ManageUsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () async {
            showAdaptiveDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return DeleteUserAlertDialog(
                    userId: userData.id!, cubit: cubit);
              },
            );
          },
        ),
        children: const [DismissibleContainer()],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(kLightGrey.value),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(userData.imageUrl!),
            ),
            const WidthSpacer(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: userData.username!,
                    style: appStyle(
                      20,
                      Color(kDark.value),
                      FontWeight.w600,
                    ),
                  ),
                  ReusableText(
                    text: userData.email!,
                    style: appStyle(
                      18,
                      Color(kLightGrey.value),
                      FontWeight.w500,
                    ),
                  ),
                  const HeightSpacer(size: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.6,
                        child: ReusableText(
                          text: userData.phone!,
                          style: appStyle(
                            18,
                            Color(kDarkGrey.value),
                            FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const WidthSpacer(width: 10),
            CircleAvatar(
              radius: 20,
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
