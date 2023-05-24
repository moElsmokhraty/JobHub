import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/features/main/presentation/providers/drawer_provider.dart';
import 'package:provider/provider.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key, required this.indexSetter}) : super(key: key);

  final ValueSetter indexSetter;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerNotifier>(
      builder: (context, zoomNotifier, child) => GestureDetector(
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
                  zoomNotifier.changeIndex(0);
                },
                index: 0,
                color: Color(zoomNotifier.currentIndex == 0
                    ? kLight.value
                    : kLightGrey.value),
                text: 'Home',
                icon: Icons.home_outlined,
              ),
              DrawerItem(
                onTap: () {
                  zoomNotifier.changeIndex(1);
                },
                index: 1,
                color: Color(zoomNotifier.currentIndex == 1
                    ? kLight.value
                    : kLightGrey.value),
                text: 'Chat',
                icon: Ionicons.chatbubble_outline,
              ),
              DrawerItem(
                onTap: () {
                  zoomNotifier.changeIndex(2);
                },
                index: 2,
                color: Color(zoomNotifier.currentIndex == 2
                    ? kLight.value
                    : kLightGrey.value),
                text: 'Bookmarks',
                icon: Icons.bookmark_outline_outlined,
              ),
              DrawerItem(
                onTap: () {
                  zoomNotifier.changeIndex(3);
                },
                index: 3,
                color: Color(zoomNotifier.currentIndex == 3
                    ? kLight.value
                    : kLightGrey.value),
                text: 'Device Management',
                icon: Icons.devices_outlined,
              ),
              DrawerItem(
                onTap: () {
                  zoomNotifier.changeIndex(4);
                },
                index: 4,
                color: Color(zoomNotifier.currentIndex == 4
                    ? kLight.value
                    : kLightGrey.value),
                text: 'Profile',
                icon: Icons.account_circle_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
