import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaCubit cubit = BlocProvider.of(context);
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () async {
            await cubit.pickUserImage();
          },
          child: state is ImageUploadLoading
              ? const Center(child: CircularProgressIndicator())
              : CircleAvatar(
                  backgroundColor: Color(kLightBlue.value),
                  backgroundImage: CachedNetworkImageProvider(cubit.imageUrl ?? ''),
                ),
        ),
      ),
    );
  }
}
