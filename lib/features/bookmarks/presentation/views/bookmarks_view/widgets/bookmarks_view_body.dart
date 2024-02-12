import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/core/widgets/states/empty_list_state.dart';
import 'package:job_hub/features/bookmarks/presentation/cubits/bookmarks_cubit.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/widgets/slidable_bookmark_tile.dart';

class BookmarksViewBody extends StatelessWidget {
  const BookmarksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    BookmarksCubit cubit = BlocProvider.of(context);
    return BlocConsumer<BookmarksCubit, BookmarksState>(
      listener: (context, state) {
        if (state is DeleteBookmarkFailure) {
          showCustomSnackBar(context, 'Error: ${state.errMessage}');
        } else if (state is DeleteBookmarkSuccess) {
          showCustomSnackBar(context, 'Bookmark Deleted Successfully');
        }
      },
      builder: (context, state) {
        if (state is GetAllBookmarksSuccess) {
          if (state.bookmarks.isEmpty) {
            return const EmptyListWidget(text: 'No Bookmarks Found');
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.bookmarks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlidableBookmarkTile(
                    job: state.bookmarks[index].job!,
                    bookmark: state.bookmarks[index],
                    cubit: cubit,
                  ),
                );
              },
            );
          }
        } else if (state is GetAllBookmarksFailure) {
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
