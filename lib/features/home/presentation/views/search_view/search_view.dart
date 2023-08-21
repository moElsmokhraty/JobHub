import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/home/presentation/views/search_view/widgets/custom_field.dart';
import 'package:job_hub/features/home/presentation/views/search_view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    JobsCubit cubit = BlocProvider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            cubit.searchController.clear();
            GoRouter.of(context).pop();
            cubit.getAllJobs();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: CustomField(
          suffixIcon: GestureDetector(
            onTap: () {
              if (cubit.searchController.text.isEmpty) {
                showCustomSnackBar(context, 'Please enter a search term');
              } else {
                cubit.searchJobs(cubit.searchController.text);
              }
            },
            child: const Icon(Icons.search_outlined),
          ),
          hintText: 'Search for a Job',
          controller: cubit.searchController,
        ),
        iconTheme: IconThemeData(
          color: Color(kLight.value),
        ),
      ),
      body: SafeArea(
        child: SearchViewBody(
          controller: cubit.searchController,
        ),
      ),
    );
  }
}
