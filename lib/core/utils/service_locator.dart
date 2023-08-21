import 'package:job_hub/features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'package:job_hub/features/chat/data/repos/conversation_repo/conversation_repo_impl.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/bookmarks/data/repos/bookmarks_repo_impl.dart';
import 'package:job_hub/features/home/data/repos/jobs_repo/jobs_repo_impl.dart';

import 'api_config/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: APIConfig.baseUrl,
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<JobsRepoImpl>(
    JobsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<BookmarksRepoImpl>(
    BookmarksRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<ChatRepoImpl>(
    ChatRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<ConversationRepoImpl>(
    ConversationRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
