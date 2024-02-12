import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/add_bookmark_button.dart';

class JobsDetailsViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const JobsDetailsViewAppBar({
    super.key,
    required this.company,
    required this.jobId,
  });

  final String company;
  final String jobId;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      actions: [AddBookmarkButton(jobId: jobId)],
      leading: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(CupertinoIcons.arrow_left),
      ),
      title: company,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
