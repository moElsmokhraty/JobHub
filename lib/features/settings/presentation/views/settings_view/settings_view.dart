import 'package:flutter/material.dart';
import 'package:job_hub/features/settings/presentation/views/settings_view/widgets/settings_app_bar.dart';
import 'package:job_hub/features/settings/presentation/views/settings_view/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        appBar: SettingsAppBar(),
        body: SettingsViewBody(),
      ),
    );
  }
}
