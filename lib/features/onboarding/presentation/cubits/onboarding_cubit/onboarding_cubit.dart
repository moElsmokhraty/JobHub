import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  PageController onBoardController = PageController();

  bool _isLastPage = false;

  bool get isLastPage => _isLastPage;

  set isLastPage(bool lastPage) {
    _isLastPage = lastPage;
    emit(OnboardingPageChanged());
  }
}
