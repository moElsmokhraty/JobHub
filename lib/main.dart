import 'package:flutter/services.dart';
import 'package:job_hub/features/main/presentation/providers/drawer_provider.dart';
import 'package:job_hub/features/main/presentation/views/main_view.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/image_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/jobs/presentation/providers/jobs_provider.dart';
import 'features/auth/presentation/providers/login_provider.dart';
import 'features/auth/presentation/providers/register_provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'features/auth/presentation/providers/profile_provider.dart';
import 'features/bookmarks/presentation/providers/bookmark_provider.dart';
import 'features/onboarding/presentation/providers/onboarding_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
        ChangeNotifierProvider(create: (context) => LoginNotifier()),
        ChangeNotifierProvider(create: (context) => DrawerNotifier()),
        ChangeNotifierProvider(create: (context) => RegisterNotifier()),
        ChangeNotifierProvider(create: (context) => JobsNotifier()),
        ChangeNotifierProvider(create: (context) => BookMarkNotifier()),
        ChangeNotifierProvider(create: (context) => ImageUploader()),
        ChangeNotifierProvider(create: (context) => ProfileNotifier()),
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
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'JobHub',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(kLight.value),
            iconTheme: IconThemeData(
              color: Color(kDark.value),
            ),
            primarySwatch: Colors.grey,
          ),
          home: const MainView(),
        );
      },
    );
  }
}
