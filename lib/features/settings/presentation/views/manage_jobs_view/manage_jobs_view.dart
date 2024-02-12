import 'package:flutter/material.dart';
import 'widgets/manage_jobs_app_bar.dart';
import 'widgets/manage_jobs_view_body.dart';
import 'widgets/add_job_floating_button.dart';

class ManageJobsView extends StatelessWidget {
  const ManageJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        floatingActionButton: AddJobFloatingButton(),
        appBar: ManageJobsAppBar(),
        body: ManageJobsViewBody());
  }
}
