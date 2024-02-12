import 'package:flutter/material.dart';
import 'text_fields_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/features/settings/presentation/cubits/create_job_cubit/create_job_cubit.dart';

class TextFieldsListView extends StatelessWidget {
  const TextFieldsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final listViewHeight = MediaQuery.of(context).size.height * 0.8;
    CreateJobCubit cubit = BlocProvider.of(context);
    final List<Widget> items = [
      TextFieldsListViewItem(
        label: 'Job Title',
        hintText: 'Enter job title',
        controller: cubit.jobTitleController,
      ),
      TextFieldsListViewItem(
        label: 'Company Name',
        hintText: 'Enter company name',
        controller: cubit.jobCompanyController,
      ),
      TextFieldsListViewItem(
        label: 'Job Description',
        hintText: 'Enter job description',
        controller: cubit.jobDescriptionController,
      ),
      TextFieldsListViewItem(
        label: 'Job Location',
        hintText: 'Enter job location',
        controller: cubit.jobLocationController,
      ),
      TextFieldsListViewItem(
        label: 'Job Salary',
        hintText: 'Enter job salary',
        controller: cubit.jobSalaryController,
      ),
      TextFieldsListViewItem(
        label: 'Contract Period',
        hintText: 'Enter contract period',
        controller: cubit.jobContractPeriodController,
      ),
      TextFieldsListViewItem(
        label: 'Work Hours',
        hintText: 'Enter work hours',
        controller: cubit.jobWorkHoursController,
      ),
      TextFieldsListViewItem(
        label: 'First Requirement',
        hintText: 'Enter first requirement',
        controller: cubit.jobFirstRequirementController,
      ),
      TextFieldsListViewItem(
        label: 'Second Requirement',
        hintText: 'Enter second requirement',
        controller: cubit.jobSecondRequirementController,
      ),
      TextFieldsListViewItem(
        label: 'Third Requirement',
        hintText: 'Enter third requirement',
        controller: cubit.jobThirdRequirementController,
      ),
      TextFieldsListViewItem(
        label: 'Fourth Requirement',
        hintText: 'Enter fourth requirement',
        controller: cubit.jobFourthRequirementController,
      ),
    ];
    return SizedBox(
      height: listViewHeight,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: items[index],
          );
        },
      ),
    );
  }
}
