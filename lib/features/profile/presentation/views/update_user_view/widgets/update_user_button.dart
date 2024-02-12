import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/functions/validate_skills.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/profile/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class UpdateUserButton extends StatelessWidget {
  const UpdateUserButton({super.key, required this.cubit, required this.state});

  final UpdateUserCubit cubit;
  final UpdateUserState state;

  @override
  Widget build(BuildContext context) {
    return state is UpdateUserLoading
        ? Center(child: CircularProgressIndicator(color: Color(kOrange.value)))
        : CustomButton(
            text: 'Save Changes',
            onTap: () async {
              if (cubit.updateUserKey.currentState!.validate()) {
                cubit.updateUser(
                  UpdateUserRequest(
                    location: cubit.locationController.text,
                    phone:
                        '+${cubit.codeController.text}${cubit.phoneController.text}',
                    imageUrl: BlocProvider.of<MediaCubit>(context).imageUrl!,
                    resumeUrl: BlocProvider.of<MediaCubit>(context).resumeUrl!,
                    skills: validateSkills(
                      [
                        cubit.firstSkillController.text,
                        cubit.secondSkillController.text,
                        cubit.thirdSkillController.text,
                        cubit.fourthSkillController.text,
                      ],
                    ),
                  ),
                );
              }
            },
          );
  }
}
