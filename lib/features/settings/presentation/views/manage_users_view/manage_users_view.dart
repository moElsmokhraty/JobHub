import 'package:flutter/material.dart';
import 'package:job_hub/features/settings/presentation/views/manage_users_view/widgets/manage_users_app_bar.dart';
import 'package:job_hub/features/settings/presentation/views/manage_users_view/widgets/manage_users_view_body.dart';

class ManageUsersView extends StatelessWidget {
  const ManageUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ManageUsersAppBar(),
      body: ManageUsersViewBody(),
    );
  }
}
