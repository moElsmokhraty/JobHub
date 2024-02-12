import 'package:flutter/material.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/profile/presentation/views/update_user_view/widgets/update_user_app_bar.dart';
import 'package:job_hub/features/profile/presentation/views/update_user_view/widgets/update_user_view_body.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        appBar: UpdateUserAppBar(),
        body: UpdateUserViewBody(),
      ),
    );
  }
}
