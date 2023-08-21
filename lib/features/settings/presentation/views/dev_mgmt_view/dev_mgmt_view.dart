import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/settings/presentation/views/dev_mgmt_view/widgets/dev_mgmt_app_bar.dart';
import 'package:job_hub/features/settings/presentation/views/dev_mgmt_view/widgets/dev_mgmt_view_body.dart';

class DevMgmtView extends StatelessWidget {
  const DevMgmtView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const DevMgmtAppBar(),
      ),
      body: const SafeArea(
        child: DevMgmtViewBody(),
      ),
    );
  }
}
