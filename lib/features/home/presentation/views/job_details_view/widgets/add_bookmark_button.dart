import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/features/bookmarks/data/models/add_bookmark_request.dart';
import 'package:job_hub/features/bookmarks/presentation/cubits/bookmarks_cubit.dart';

class AddBookmarkButton extends StatelessWidget {
  const AddBookmarkButton({super.key, required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context) {
    BookmarksCubit cubit = BlocProvider.of(context);
    return BlocConsumer<BookmarksCubit, BookmarksState>(
      listener: (context, state) {
        if (state is AddBookmarkSuccess) {
          showCustomSnackBar(context, 'Added to bookmarks successfully');
        } else if (state is AddBookmarkFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is AddBookmarkLoading) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Center(
              widthFactor: 2,
              child: CircularProgressIndicator(color: Color(kOrange.value)),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
              icon: const Icon(CupertinoIcons.bookmark_solid),
              onPressed: () {
                cubit.addBookmark(AddBookmarkRequest(jobId: jobId));
              },
            ),
          );
        }
      },
    );
  }
}
