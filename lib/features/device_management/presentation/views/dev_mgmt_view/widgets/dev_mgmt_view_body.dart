import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/device_management/data/models/dev_data.dart';
import 'package:job_hub/features/device_management/presentation/views/dev_mgmt_view/widgets/devs_info.dart';

class DevMgmtViewBody extends StatelessWidget {
  const DevMgmtViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    //OnBoardNotifier onBoardNotifier = Provider.of<OnBoardNotifier>(context);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(size: 50),
              Text(
                'You are logged in into your account on these devices',
                style: appStyle(16, Color(kDark.value), FontWeight.normal),
              ),
              const HeightSpacer(size: 50),
              const DevsInfo(
                devData: DevData(),
              ),
              const HeightSpacer(size: 50),
              const DevsInfo(
                devData: DevData(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
