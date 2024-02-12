import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/validate_skills.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_request.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.cubit, required this.state});

  final RegisterCubit cubit;
  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    return state is RegisterLoading
        ? Center(child: CircularProgressIndicator(color: Color(kOrange.value)))
        : CustomButton(
            text: 'Create Account',
            onTap: () async {
              if (cubit.completeInfoKey.currentState!.validate()) {
                cubit.register(
                  RegisterRequest(
                    username: cubit.usernameController.text,
                    email: cubit.emailController.text,
                    password: cubit.passwordController.text,
                    location: cubit.locationController.text,
                    phone:
                        '+${cubit.codeController.text}${cubit.phoneController.text}',
                    imageUrl: userImage!,
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
