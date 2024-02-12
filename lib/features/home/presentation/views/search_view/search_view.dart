import 'package:flutter/material.dart';
import 'package:job_hub/features/home/presentation/views/search_view/widgets/search_app_bar.dart';
import 'package:job_hub/features/home/presentation/views/search_view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SearchAppBar(),
        body: SearchViewBody(),
      ),
    );
  }
}
