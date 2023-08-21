import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width * 0.84,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FeatherIcons.search,
                      color: Color(kOrange.value),
                      size: 20.h,
                    ),
                    const WidthSpacer(width: 20),
                    ReusableText(
                      text: 'Search For Jobs',
                      style: appStyle(
                        18,
                        Color(kOrange.value),
                        FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                FeatherIcons.sliders,
                color: Color(kOrange.value),
                size: 20.w,
              ),
            ],
          ),
          const HeightSpacer(size: 7),
          Divider(
            color: Color(kDarkGrey.value),
            thickness: 0.5,
            endIndent: 40.w,
          ),
        ],
      ),
    );
  }
}
