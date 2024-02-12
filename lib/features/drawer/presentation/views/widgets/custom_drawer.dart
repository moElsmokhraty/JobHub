import 'package:job_hub/features/bookmarks/presentation/cubits/bookmarks_cubit.dart';

import 'drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_hub/features/drawer/presentation/cubits/drawer_cubit/drawer_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.indexSetter});

  final Function(int) indexSetter;

  @override
  Widget build(BuildContext context) {
    CustomDrawerCubit cubit = BlocProvider.of(context);
    return BlocBuilder<CustomDrawerCubit, CustomDrawerState>(
      builder: (context, state) {
        return GestureDetector(
          onDoubleTap: () {
            ZoomDrawer.of(context)!.toggle();
          },
          child: Scaffold(
            backgroundColor: Color(kLightBlue.value),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(
                  onTap: () {
                    cubit.changeIndex(0);
                  },
                  index: 0,
                  color: Color(cubit.currentIndex == 0
                      ? kLight.value
                      : kLightGrey.value),
                  text: 'Home',
                  icon: Icons.home_outlined,
                ),
                DrawerItem(
                  onTap: () {
                    cubit.changeIndex(1);
                  },
                  index: 1,
                  color: Color(cubit.currentIndex == 1
                      ? kLight.value
                      : kLightGrey.value),
                  text: 'Chat',
                  icon: Ionicons.chatbubble_outline,
                ),
                DrawerItem(
                  onTap: () async {
                    cubit.changeIndex(2);
                    await BlocProvider.of<BookmarksCubit>(context)
                        .getAllBookmarks();
                  },
                  index: 2,
                  color: Color(cubit.currentIndex == 2
                      ? kLight.value
                      : kLightGrey.value),
                  text: 'Bookmarks',
                  icon: Icons.bookmark_outline_outlined,
                ),
                DrawerItem(
                  onTap: () {
                    cubit.changeIndex(3);
                  },
                  index: 3,
                  color: Color(cubit.currentIndex == 3
                      ? kLight.value
                      : kLightGrey.value),
                  text: 'Settings',
                  icon: Icons.settings_outlined,
                ),
                DrawerItem(
                  onTap: () {
                    cubit.changeIndex(4);
                  },
                  index: 4,
                  color: Color(cubit.currentIndex == 4
                      ? kLight.value
                      : kLightGrey.value),
                  text: 'Profile',
                  icon: Icons.account_circle_outlined,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
