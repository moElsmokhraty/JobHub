import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/widgets/custom_list_tile.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';

class AdminPanelViewBody extends StatelessWidget {
  const AdminPanelViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: 'App users',
          subtitle: 'Manage app users',
          trailingIcon: Icons.people_outline_outlined,
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRoutes.kManageUsersView);
          },
        ),
        CustomListTile(
          title: 'App jobs',
          subtitle: 'Manage app jobs',
          trailingIcon: Icons.work_outline_outlined,
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRoutes.kManageJobsView);
          },
        ),
      ],
    );
  }
}
