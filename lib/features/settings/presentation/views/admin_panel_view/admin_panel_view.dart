import 'package:flutter/material.dart';
import 'package:job_hub/features/settings/presentation/views/admin_panel_view/widgets/admin_panel_app_bar.dart';
import 'package:job_hub/features/settings/presentation/views/admin_panel_view/widgets/admin_panel_view_body.dart';

class AdminPanelView extends StatelessWidget {
  const AdminPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminPanelAppBar(),
      body: AdminPanelViewBody(),
    );
  }
}
