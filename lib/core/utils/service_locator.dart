import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_config/api_service.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/bookmarks/data/repos/bookmarks_repo_impl.dart';
import 'package:job_hub/features/home/data/repos/jobs_repo/jobs_repo_impl.dart';
import 'package:job_hub/features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'package:job_hub/features/profile/data/repos/profile_repo/profile_repo_impl.dart';
import 'package:job_hub/features/chat/data/repos/conversation_repo/conversation_repo_impl.dart';
import 'package:job_hub/features/settings/data/repos/manage_users_repo/manage_users_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: APIConfig.baseUrl,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
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

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
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

  getIt.registerSingleton<ManageUsersRepoImpl>(
    ManageUsersRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
