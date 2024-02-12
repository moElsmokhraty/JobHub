import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';

class AddJobFloatingButton extends StatelessWidget {
  const AddJobFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        GoRouter.of(context).push(AppRoutes.kAddJobView);
      },
      backgroundColor: kOrange,
      child: const Icon(
        Icons.add_outlined,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
