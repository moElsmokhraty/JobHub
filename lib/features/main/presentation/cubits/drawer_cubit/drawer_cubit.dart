import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/features/auth/presentation/views/profile_view/profile_view.dart';
import 'package:job_hub/features/bookmarks/presentation/views/bookmarks_view/bookmarks_view.dart';
import 'package:job_hub/features/chat/presentation/views/chat_view/chat_view.dart';
import 'package:job_hub/features/device_management/presentation/views/dev_mgmt_view/dev_mgmt_view.dart';
import 'package:job_hub/features/home/presentation/views/home_view/home_view.dart';

part 'drawer_state.dart';

class CustomDrawerCubit extends Cubit<CustomDrawerState> {
  CustomDrawerCubit() : super(DrawerInitial());

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(IndexChanged());
  }

  Widget mainScreen(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const ChatView();
      case 2:
        return const BookmarksView();
      case 3:
        return const DevMgmtView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}
