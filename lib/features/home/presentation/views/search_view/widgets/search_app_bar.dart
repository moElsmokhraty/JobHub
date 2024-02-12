import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';

import '../../../../../../core/utils/constants.dart';
import 'custom_field.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    final JobsCubit cubit = BlocProvider.of<JobsCubit>(context);
    return AppBar(
      backgroundColor: Color(kOrange.value),
      elevation: 0,
      scrolledUnderElevation: 0.0,
      iconTheme: IconThemeData(
        color: Color(kLight.value),
      ),
      leading: GestureDetector(
        onTap: () {
          cubit.searchController.clear();
          GoRouter.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      title: CustomField(
        suffixIcon: GestureDetector(
          onTap: () async {
            await cubit.searchJobs();
          },
          child: const Icon(Icons.search_outlined),
        ),
        hintText: 'Search for a Job',
        controller: cubit.searchController,
        onSubmitted: () async {
          await cubit.searchJobs();
        },
      ),
    );
  }
}
