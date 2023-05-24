import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/features/main/presentation/providers/drawer_provider.dart';
import 'package:job_hub/features/main/presentation/views/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerNotifier>(
      builder: (context, zoomNotifier, child) => ZoomDrawer(
        menuScreen: CustomDrawer(
          indexSetter: (index) {
            zoomNotifier.currentIndex = index;
          },
        ),
        mainScreen: zoomNotifier.mainScreen(context),
        showShadow: true,
        borderRadius: 30,
        angle: 0.0,
        slideWidth: 250,
        menuBackgroundColor: Color(kLightBlue.value),
      ),
    );
  }
}
