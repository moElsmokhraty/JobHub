import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/handle_cache.dart';
import 'package:job_hub/core/widgets/custom_list_tile.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/drawer/presentation/cubits/drawer_cubit/drawer_cubit.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomListTile(
          title: isAdmin! ? 'Admin Panel' : 'Change Password',
          subtitle: isAdmin! ? 'Manage your app' : 'Change your password',
          trailingIcon: isAdmin!
              ? Icons.admin_panel_settings_outlined
              : Icons.lock_outlined,
          onTap: () {
            isAdmin!
                ? GoRouter.of(context).push(AppRoutes.kAdminPanelView)
                : GoRouter.of(context).push(AppRoutes.kChangePasswordView);
          },
        ),
        Visibility(
          visible: !isAdmin!,
          child: CustomListTile(
            title: 'Delete Account',
            subtitle: 'Delete your account',
            trailingIcon: Icons.delete_sweep_outlined,
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kDeleteAccountView);
            },
          ),
        ),
        CustomListTile(
          title: 'Log Out',
          subtitle: 'Log out of your account',
          trailingIcon: Icons.logout,
          onTap: () async {
            BlocProvider.of<CustomDrawerCubit>(context).changeIndex(0);
            GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
            await removeCache();
          },
        ),
        CustomListTile(
          title: 'App Version',
          subtitle: '1.0.0',
          trailingIcon: Icons.info_outline,
          onTap: () {},
        ),
      ],
    );
  }
}
