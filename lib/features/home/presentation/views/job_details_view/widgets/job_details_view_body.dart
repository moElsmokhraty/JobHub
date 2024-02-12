import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/job_apply_button.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/job_requirements_list_view.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/job_summary.dart';

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
            physics: const BouncingScrollPhysics(),
            children: [
              const HeightSpacer(size: 30),
              JobSummary(job: job),
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
              JobRequirementsListView(requirements: job.requirements ?? []),
              const HeightSpacer(size: 20),
            ],
          ),
          const JobApplyButton()
        ],
      ),
    );
  }
}
