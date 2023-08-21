import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/features/main/presentation/cubits/drawer_cubit/drawer_cubit.dart';
import 'package:job_hub/features/main/presentation/views/widgets/custom_drawer.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    CustomDrawerCubit cubit = BlocProvider.of<CustomDrawerCubit>(context);
    return BlocBuilder<CustomDrawerCubit, CustomDrawerState>(
      builder: (context, state) => ZoomDrawer(
        androidCloseOnBackTap: true,
        menuScreen: CustomDrawer(
          indexSetter: (index) {
            cubit.currentIndex = index;
          },
        ),
        mainScreen: WillPopScope(
          onWillPop: () async {
            if (cubit.currentIndex != 0) {
              cubit.changeIndex(0);
              return false;
            }
            return true;
          },
          child: cubit.mainScreen(context),
        ),
        showShadow: true,
        borderRadius: 30,
        angle: 0.0,
        slideWidth: 250,
        menuBackgroundColor: Color(kLightBlue.value),
      ),
    );
  }
}
