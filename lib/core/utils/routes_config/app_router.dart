import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'package:job_hub/features/chat/data/repos/conversation_repo/conversation_repo_impl.dart';
import 'package:job_hub/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:job_hub/features/chat/presentation/views/chat_view/chat_view.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/conversation_view.dart';

import '../constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/service_locator.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/main/presentation/views/main_view.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/home/presentation/views/home_view/home_view.dart';
import 'package:job_hub/features/auth/presentation/views/login_view/login_view.dart';
import 'package:job_hub/features/home/presentation/views/search_view/search_view.dart';
import 'package:job_hub/features/main/presentation/cubits/drawer_cubit/drawer_cubit.dart';
import 'package:job_hub/features/auth/presentation/views/register_view/register_view.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/all_jobs_view.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/job_details_view.dart';
import 'package:job_hub/features/auth/presentation/views/update_user_view/update_user_view.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/bookmarks_view.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/onboarding_view.dart';
import 'package:job_hub/features/onboarding/presentation/cubits/onboarding_cubit/onboarding_cubit.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_and_update_cubit/register_and_update_cubit.dart';

import 'app_routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: firstTime!
        ? AppRoutes.kOnBoardingView
        : (token != '' ? AppRoutes.kMainView : AppRoutes.kLoginView),
    routes: [
      GoRoute(
        path: AppRoutes.kOnBoardingView,
        builder: (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnboardingView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RegisterAndUpdateCubit(getIt.get<AuthRepoImpl>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kUpdateUserView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RegisterAndUpdateCubit(getIt.get<AuthRepoImpl>()),
          child: UpdateUserView(data: state.extra as Map<String, dynamic>),
        ),
      ),
      GoRoute(
        path: AppRoutes.kMainView,
        builder: (context, state) => BlocProvider(
            create: (context) => CustomDrawerCubit(), child: const MainView()),
      ),
      GoRoute(
        path: AppRoutes.kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.kJobDetailsView,
        builder: (context, state) => JobDetailsView(job: state.extra as Job),
      ),
      GoRoute(
        path: AppRoutes.kAllJobsView,
        builder: (context, state) => const AllJobsView(),
      ),
      GoRoute(
        path: AppRoutes.kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: AppRoutes.kBookmarksView,
        builder: (context, state) => const BookmarksView(),
      ),
      GoRoute(
        path: AppRoutes.kChatsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ChatCubit(getIt.get<ChatRepoImpl>())..getAllChats(),
          child: const ChatView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kConversationView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ConversationCubit(getIt.get<ConversationRepoImpl>())
                ..connect()
                ..getAllMessages(chatId: (state.extra as Chat).id!),
          child: ConversationView(chat: state.extra as Chat),
        ),
      ),
    ],
  );
}
