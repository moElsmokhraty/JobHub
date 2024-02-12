import 'package:job_hub/features/profile/data/repos/profile_repo/profile_repo_impl.dart';
import 'package:job_hub/features/profile/presentation/cubits/update_user_cubit/update_user_cubit.dart';
import 'package:job_hub/features/settings/data/repos/manage_users_repo/manage_users_repo_impl.dart';
import 'package:job_hub/features/settings/presentation/cubits/manage_users_cubit/manage_users_cubit.dart';
import 'package:job_hub/features/settings/presentation/views/manage_users_view/manage_users_view.dart';

import 'app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/service_locator.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';
import 'package:job_hub/features/drawer/presentation/views/drawer_view.dart';
import 'package:job_hub/features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/home/data/repos/jobs_repo/jobs_repo_impl.dart';
import 'package:job_hub/features/chat/presentation/views/chat_view/chat_view.dart';
import 'package:job_hub/features/home/presentation/views/home_view/home_view.dart';
import 'package:job_hub/features/auth/presentation/views/login_view/login_view.dart';
import 'package:job_hub/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:job_hub/features/home/presentation/views/search_view/search_view.dart';
import 'package:job_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/auth/presentation/views/register_view/register_view.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/all_jobs_view.dart';
import 'package:job_hub/features/profile/presentation/views/profile_view/profile_view.dart';
import 'package:job_hub/features/settings/presentation/views/settings_view/settings_view.dart';
import 'package:job_hub/features/chat/data/repos/conversation_repo/conversation_repo_impl.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/job_details_view.dart';
import 'package:job_hub/features/auth/presentation/views/delete_user_view/delete_user_view.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/bookmarks_view.dart';
import 'package:job_hub/features/chat/presentation/views/conversation_view/conversation_view.dart';
import 'package:job_hub/features/settings/presentation/views/create_job_view/create_job_view.dart';
import 'package:job_hub/features/settings/presentation/views/update_job_view/update_job_view.dart';
import 'package:job_hub/features/profile/presentation/views/update_user_view/update_user_view.dart';
import 'package:job_hub/features/auth/presentation/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:job_hub/features/settings/presentation/views/admin_panel_view/admin_panel_view.dart';
import 'package:job_hub/features/settings/presentation/views/manage_jobs_view/manage_jobs_view.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/onboarding_view.dart';
import 'package:job_hub/features/auth/presentation/views/complete_info_view/complete_info_view.dart';
import 'package:job_hub/features/settings/presentation/cubits/create_job_cubit/create_job_cubit.dart';
import 'package:job_hub/features/settings/presentation/cubits/update_job_cubit/update_job_cubit.dart';
import 'package:job_hub/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:job_hub/features/onboarding/presentation/cubits/onboarding_cubit/onboarding_cubit.dart';
import 'package:job_hub/features/auth/presentation/views/change_password_view/change_password_view.dart';
import 'package:job_hub/features/auth/presentation/cubits/change_password_cubit/change_password_cubit.dart';

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
        builder: (context, state) => BlocProvider(
            create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
            child: const LoginView()),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.kCompleteInfoView,
        builder: (context, state) => const CompleteInfoView(),
      ),
      GoRoute(
        path: AppRoutes.kUpdateUserView,
        builder: (context, state) => BlocProvider(
          create: (context) => UpdateUserCubit(getIt.get<ProfileRepoImpl>())
            ..setValues(
              state.extra as UserData,
              context,
            ),
          child: UpdateUserView(userData: state.extra as UserData),
        ),
      ),
      GoRoute(
        path: AppRoutes.kChangePasswordView,
        builder: (context, state) => BlocProvider(
            create: (context) => ChangePasswordCubit(getIt.get<AuthRepoImpl>()),
            child: const ChangePasswordView()),
      ),
      GoRoute(
        path: AppRoutes.kDeleteAccountView,
        builder: (context, state) => BlocProvider(
            create: (context) => DeleteUserCubit(getIt.get<AuthRepoImpl>()),
            child: const DeleteUserView()),
      ),
      GoRoute(
        path: AppRoutes.kMainView,
        builder: (context, state) => const MainView(),
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
        path: AppRoutes.kSettingsView,
        builder: (context, state) => const SettingsView(),
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
                ..getAllMessages(chatId: (state.extra as Chat).id!)
                ..connect((state.extra as Chat).id!)
                ..joinChat((state.extra as Chat).id!)
                ..handleScroll(),
          child: ConversationView(chat: state.extra as Chat),
        ),
      ),
      GoRoute(
        path: AppRoutes.kAdminPanelView,
        builder: (context, state) => const AdminPanelView(),
      ),
      GoRoute(
        path: AppRoutes.kManageJobsView,
        builder: (context, state) => const ManageJobsView(),
      ),
      GoRoute(
        path: AppRoutes.kUpdateJobView,
        builder: (context, state) => BlocProvider(
          create: (context) => UpdateJobCubit(getIt.get<JobsRepoImpl>())
            ..setValues(state.extra as Job, context),
          child: UpdateJobView(job: state.extra as Job),
        ),
      ),
      GoRoute(
        path: AppRoutes.kAddJobView,
        builder: (context, state) => BlocProvider(
          create: (context) => CreateJobCubit(getIt.get<JobsRepoImpl>()),
          child: const CreateJobView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: AppRoutes.kManageUsersView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ManageUsersCubit(getIt.get<ManageUsersRepoImpl>())..getAllUsers(),
          child: const ManageUsersView(),
        ),
      ),
    ],
  );
}
