import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/widgets/bookmarks_app_bar.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/widgets/bookmarks_view_body.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const BookmarksAppBar(),
      ),
      body: const BookmarksViewBody(),
    );
  }
}
