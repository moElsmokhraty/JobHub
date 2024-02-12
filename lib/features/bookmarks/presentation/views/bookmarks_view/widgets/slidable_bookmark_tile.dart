import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/bookmarks/data/models/bookmark.dart';
import 'package:job_hub/features/bookmarks/data/models/delete_bookmark_request.dart';
import 'package:job_hub/features/bookmarks/presentation/cubits/bookmarks_cubit.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/widgets/job_tile.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/widgets/dismissible_container.dart';

class SlidableBookmarkTile extends StatelessWidget {
  const SlidableBookmarkTile({
    super.key,
    required this.job,
    required this.bookmark,
    required this.cubit,
  });

  final Job job;
  final Bookmark bookmark;
  final BookmarksCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () async {
            await cubit
                .deleteBookmark(DeleteBookmarkRequest(bookmarkId: bookmark.id))
                .then(
              (value) {
                cubit.getAllBookmarks();
              },
            );
          },
        ),
        children: const [DismissibleContainer()],
      ),
      child: JobTile(job: job),
    );
  }
}
