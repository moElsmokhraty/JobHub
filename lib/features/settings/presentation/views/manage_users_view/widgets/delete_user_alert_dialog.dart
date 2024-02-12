import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_request.dart';
import 'package:job_hub/features/settings/presentation/cubits/manage_users_cubit/manage_users_cubit.dart';

class DeleteUserAlertDialog extends StatelessWidget {
  const DeleteUserAlertDialog(
      {super.key, required this.userId, required this.cubit});

  final String userId;
  final ManageUsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ReusableText(
        text: 'Delete User',
        style: appStyle(
          16,
          Color(kDark.value),
          FontWeight.bold,
        ),
      ),
      content: ReusableText(
        text: 'Are you sure you want to delete this user?',
        style: appStyle(
          12,
          Color(kDarkGrey.value),
          FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: ReusableText(
            text: 'Cancel',
            style: appStyle(
              12,
              Color(kLightBlue.value),
              FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await cubit
                .deleteUser(DeleteUserRequest(userId: userId))
                .then((value) async {
              GoRouter.of(context).pop();
              await cubit.getAllUsers();
            });
          },
          child: ReusableText(
            text: 'Delete',
            style: appStyle(
              12,
              Color(kLightBlue.value),
              FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
