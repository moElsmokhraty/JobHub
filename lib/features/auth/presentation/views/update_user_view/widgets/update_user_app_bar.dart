import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UpdateUserAppBar extends StatelessWidget {
  const UpdateUserAppBar({
    super.key,
  });

  //final Future<void> pickImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: 'PersonalDetails',
          style: appStyle(35, Color(kDark.value), FontWeight.bold),
        ),
        GestureDetector(
          onTap: () async {
            //await pickImage;
          },
          child: CircleAvatar(
            backgroundColor: Color(kLightBlue.value),
            backgroundImage: userImage == null
                ? null
                : CachedNetworkImageProvider(userImage!),
            child: userImage == null
                ? const Center(child: Icon(Icons.photo_filter_rounded))
                : null,
          ),
        ),
      ],
    );
  }
}
