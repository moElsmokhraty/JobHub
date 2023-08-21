import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';

class JobsDetailsViewAppBar extends StatelessWidget {
  const JobsDetailsViewAppBar({super.key, required this.company});

  final String company;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(CupertinoIcons.bookmark_solid),
        )
      ],
      leading: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(CupertinoIcons.arrow_left),
      ),
      title: company,
    );
  }
}
