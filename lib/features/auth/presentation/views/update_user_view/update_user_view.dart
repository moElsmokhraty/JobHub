import 'package:flutter/material.dart';
import 'package:job_hub/features/auth/presentation/views/update_user_view/widgets/update_user_view_body.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: UpdateUserViewBody(),
      ),
    );
  }
}
