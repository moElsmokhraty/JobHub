import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/validate_skills.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/auth/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class UpdateUserButton extends StatelessWidget {
  const UpdateUserButton({super.key, required this.cubit});

  final UpdateUserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Save Changes',
      onTap: () async {
        if (cubit.updateUserKey.currentState!.validate()) {
          cubit.updateUser(
            UpdateUserRequest(
              location: cubit.locationController.text,
              phone: cubit.phoneController.text,
              imageUrl: userImage!,
              skills: validateSkills(
                [
                  cubit.firstSkillController.text,
                  cubit.secondSkillController.text,
                  cubit.thirdSkillController.text,
                  cubit.fourthSkillController.text,
                  cubit.fifthSkillController.text,
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
