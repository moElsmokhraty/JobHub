import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';

class EditResumeButton extends StatelessWidget {
  const EditResumeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaState>(
      listener: (context, state) {
        if (state is ResumeUploadSuccess) {
          showCustomSnackBar(context, 'Resume updated successfully!');
        }
      },
      builder: (context, state) {
        if (state is ResumeUploadLoading) {
          return Center(
            child: CircularProgressIndicator(color: Color(kLightPurple.value)),
          );
        } else {
          return GestureDetector(
            onTap: () async {
              await BlocProvider.of<MediaCubit>(context).pickResume();
            },
            child: Container(
              width: width,
              height: height * 0.065,
              color: Color(kLightPurple.value),
              child: Center(
                child: Text(
                  'Edit Resume',
                  style: appStyle(
                    16,
                    Color(kLight.value),
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
