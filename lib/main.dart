import 'firebase_options.dart';
import 'core/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'core/utils/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/routes_config/app_router.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:job_hub/core/utils/service_locator.dart';
import 'package:job_hub/core/functions/handle_cache.dart';
import 'features/home/presentation/cubits/jobs_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/chat/data/repos/chat_repo/chat_repo_impl.dart';
import 'features/home/data/repos/jobs_repo/jobs_repo_impl.dart';
import 'features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:job_hub/features/bookmarks/data/repos/bookmarks_repo_impl.dart';
import 'package:job_hub/features/bookmarks/presentation/cubits/bookmarks_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  await handleCache();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              JobsCubit(getIt.get<JobsRepoImpl>())..getAllJobs(),
        ),
        BlocProvider(
          create: (context) =>
              BookmarksCubit(getIt.get<BookmarksRepoImpl>())..getAllBookmarks(),
        ),
        BlocProvider(
          create: (context) =>
              ChatCubit(getIt.get<ChatRepoImpl>())..getAllChats(),
        ),
      ],
      child: const JobHub(),
    ),
  );
}

class JobHub extends StatelessWidget {
  const JobHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'JobHub',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Color(kLight.value),
            iconTheme: IconThemeData(color: Color(kDark.value)),
            primarySwatch: Colors.grey,
          ),
        );
      },
    );
  }
}
