import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';

class JobRequirementsListView extends StatelessWidget {
  const JobRequirementsListView({super.key, required this.requirements});

  final List<dynamic> requirements;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.6,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: requirements.length,
        itemBuilder: (context, index) {
          return Text(
            '\u2022 ${requirements[index]}\n',
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
    );
  }
}
