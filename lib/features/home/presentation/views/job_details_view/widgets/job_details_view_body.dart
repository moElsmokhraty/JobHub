import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/buttons/custom_outline_button.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:job_hub/features/home/data/models/job.dart';

class JobDetailsViewBody extends StatelessWidget {
  const JobDetailsViewBody({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              const HeightSpacer(size: 30),
              Container(
                width: width,
                height: height * 0.25,
                color: Color(kLightGrey.value),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(job.imageUrl!),
                    ),
                    const HeightSpacer(size: 10),
                    ReusableText(
                      text: job.title!,
                      style: appStyle(
                        22,
                        Color(kDark.value),
                        FontWeight.w600,
                      ),
                    ),
                    const HeightSpacer(size: 5),
                    ReusableText(
                      text: job.location!,
                      style: appStyle(
                        16,
                        Color(kDarkGrey.value),
                        FontWeight.normal,
                      ),
                    ),
                    const HeightSpacer(size: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomOutlineButton(
                            height: height * 0.04,
                            width: width * 0.27,
                            text: job.period!,
                            onTap: () {},
                            color1: Color(kOrange.value),
                            color2: Color(kLight.value),
                          ),
                          const WidthSpacer(width: 15),
                          SizedBox(
                            width: width * 0.25,
                            child: ReusableText(
                              text: '${job.salary!}/${job.contract!}',
                              style: appStyle(
                                22,
                                Color(kDark.value),
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const HeightSpacer(size: 20),
              ReusableText(
                text: 'Job Description',
                style: appStyle(
                  24,
                  Color(kDark.value),
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(size: 10),
              Text(
                job.description!,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
                style: appStyle(
                  16,
                  Color(kDarkGrey.value),
                  FontWeight.normal,
                ),
              ),
              const HeightSpacer(size: 20),
              ReusableText(
                text: 'Requirements',
                style: appStyle(
                  24,
                  Color(kDark.value),
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(size: 10),
              SizedBox(
                height: height * 0.6,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: job.requirements!.length,
                  itemBuilder: (context, index) {
                    return Text(
                      '\u2022 ${job.requirements![index]}\n',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: appStyle(
                        16,
                        Color(kDarkGrey.value),
                        FontWeight.normal,
                      ),
                    );
                  },
                ),
              ),
              const HeightSpacer(size: 20),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: CustomOutlineButton(
                height: height * 0.065,
                width: width,
                text: 'Apply Now',
                onTap: () {},
                color1: Color(kLight.value),
                color2: Color(kOrange.value),
              ),
            ),
          )
        ],
      ),
    );
  }
}
