import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';

class JobImage extends StatelessWidget {
  const JobImage({super.key, required this.cubit});

  final MediaCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        return state is ImageUploadLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(kOrange.value),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: GestureDetector(
                  onTap: () async {
                    await cubit.pickJobImage();
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: CachedNetworkImageProvider(
                        cubit.imageUrl ?? defaultImage),
                  ),
                ),
              );
      },
    );
  }
}
