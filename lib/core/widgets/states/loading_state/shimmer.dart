import 'package:flutter/material.dart';
import 'package:job_hub/core/widgets/states/loading_state/vertical_shimmer.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(12),
          child: VerticalShimmer(),
        );
      },
    );
  }
}
