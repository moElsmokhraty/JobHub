import 'package:flutter/material.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_request.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_and_update_cubit/register_and_update_cubit.dart';

class RegisterAndUpdateButton extends StatelessWidget {
  const RegisterAndUpdateButton({
    super.key,
    required this.registering,
    required this.cubit,
  });

  final bool registering;
  final RegisterAndUpdateCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: registering == true ? 'Create Account' : 'Save Changes',
      onTap: () async {
        if (cubit.registerAndUpdateKey.currentState!.validate()) {
          registering == true
              ? cubit.register(
                  RegisterRequest(
                    username: cubit.usernameController.text,
                    email: cubit.emailController.text,
                    password: cubit.passwordController.text,
                    location: cubit.locationController.text,
                    phone: cubit.phoneController.text,
                    skills: cubit.skills(
                      [
                        cubit.firstSkillController.text,
                        cubit.secondSkillController.text,
                        cubit.thirdSkillController.text,
                        cubit.fourthSkillController.text,
                        cubit.fifthSkillController.text,
                      ],
                    ),
                  ),
                )
              : cubit.updateUser(
                  UpdateUserRequest(
                    location: cubit.locationController.text,
                    phone: cubit.phoneController.text,
                    imageUrl: cubit.imageUrl!,
                    skills: cubit.skills(
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
