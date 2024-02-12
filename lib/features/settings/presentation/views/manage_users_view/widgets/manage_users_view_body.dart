import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/core/widgets/states/empty_list_state.dart';
import 'package:job_hub/features/settings/presentation/cubits/manage_users_cubit/manage_users_cubit.dart';
import 'package:job_hub/features/settings/presentation/views/manage_users_view/widgets/slidable_user_tile.dart';

class ManageUsersViewBody extends StatelessWidget {
  const ManageUsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ManageUsersCubit cubit = BlocProvider.of(context);
    return BlocConsumer<ManageUsersCubit, ManageUsersState>(
      listener: (context, state) {
        if (state is DeleteUserSuccess) {
          showCustomSnackBar(context, 'Account Deleted Successfully');
        } else if (state is DeleteUserFailure) {
          showCustomSnackBar(context, 'Error: ${state.errMessage}');
        }
      },
      builder: (context, state) {
        if (state is GetAllUsersSuccess) {
          if (state.users.isEmpty) {
            return const EmptyListWidget(text: 'No Users Found');
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlidableUserTile(
                    userData: state.users[index],
                    cubit: cubit,
                  ),
                );
              },
            );
          }
        } else if (state is GetAllUsersFailure) {
          return CustomErrorWidget(message: 'Error: ${state.errMessage}');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
