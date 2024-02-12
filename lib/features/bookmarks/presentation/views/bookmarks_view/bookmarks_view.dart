import 'package:flutter/material.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/widgets/bookmarks_app_bar.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/widgets/bookmarks_view_body.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        appBar: BookmarksAppBar(),
        body: BookmarksViewBody(),
      ),
    );
  }
}
