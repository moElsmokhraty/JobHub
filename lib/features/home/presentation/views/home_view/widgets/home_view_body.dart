import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/heading_widget.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/search.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/popular_jobs_list_view.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/recently_posted_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpacer(size: 10),
          Text(
            'Search, \nFind & Apply',
            style: appStyle(
              40,
              Color(kDark.value),
              FontWeight.w700,
            ),
          ),
          const HeightSpacer(size: 40),
          SearchWidget(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kSearchView);
            },
          ),
          const HeightSpacer(size: 30),
          HeadingWidget(
            text: 'Popular Jobs',
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kAllJobsView);
            },
          ),
          const HeightSpacer(size: 20),
          const PopularJobsListView(),
          const HeightSpacer(size: 20),
          HeadingWidget(
            text: 'Recently Posted',
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kAllJobsView);
            },
          ),
          const HeightSpacer(size: 20),
          const RecentlyPostedListView(),
        ],
      ),
    );
  }
}
