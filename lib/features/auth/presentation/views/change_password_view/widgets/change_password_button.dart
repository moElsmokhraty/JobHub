import 'package:flutter/material.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:job_hub/features/auth/presentation/cubits/change_password_cubit/change_password_cubit.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({
    super.key,
    required this.state,
    required this.cubit,
  });

  final ChangePasswordCubit cubit;
  final ChangePasswordState state;

  @override
  Widget build(BuildContext context) {
    return state is ChangePasswordLoading
        ? const Center(child: CircularProgressIndicator())
        : CustomButton(
            text: 'Change Password',
            onTap: () async {
              if (cubit.key.currentState!.validate()) {
                cubit.changePassword(
                  ChangePasswordRequest(
                    currentPassword: cubit.currentPasswordController.text,
                    newPassword: cubit.newPasswordController.text,
                  ),
                );
              }
            },
          );
  }
}
