import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_request.dart';
import 'package:job_hub/features/auth/presentation/cubits/delete_user_cubit/delete_user_cubit.dart';

class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({
    super.key,
    required this.state,
    required this.cubit,
  });

  final DeleteUserCubit cubit;
  final DeleteUserState state;

  @override
  Widget build(BuildContext context) {
    return state is DeleteUserLoading
        ? const Center(child: CircularProgressIndicator())
        : CustomButton(
            text: 'Delete Account',
            onTap: () async {
              if (cubit.key.currentState!.validate()) {
                cubit.deleteUser(
                  DeleteUserRequest(
                    userId: userId,
                    password: cubit.passwordController.text,
                  ),
                );
              }
            },
          );
  }
}
