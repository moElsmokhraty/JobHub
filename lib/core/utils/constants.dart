import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';

const kDark = Color(0xFF000000);
const kLight = Color(0xFFFFFFFF);
const kLightGrey = Color(0x97BCBABA);
const kDarkGrey = Color(0xFF9B9B9B);
const kOrange = Color(0xfff55631);
const kLightBlue = Color(0xff3663e3);
const kDarkBlue = Color(0xff1c153e);
const kLightPurple = Color(0xff6352c5);
const kDarkPurple = Color(0xff6352c5);

double height = 812.h;

double width = 375.w;

String defaultImage =
    'https://pbs.twimg.com/media/BtFUrp6CEAEmsml?format=jpg&name=small';

String? token;

bool? firstTime;

bool? registering;

String? userId;

String? userImage;

String initialLocation(firsTime, token) {
  if (firsTime) {
    return '/onboarding';
  } else {
    if (token != null && token != '') {
      return '/home';
    } else {
      return '/login';
    }
  }
}

List<String> requirements = [
  "Design and Build sophisticated and highly scalable apps using Flutter.",
  "Build custom packages in Flutter using the functionalities and APIs already available in native Android and IOS.",
  "Translate and Build the designs and Wireframes into high quality responsive UI code.",
  "Explore feasible architectures for implementing new features.",
  "Resolve any problems existing in the system and suggest and add new features in the complete system.",
  "Suggest space and time efficient Data Structures.",
];

String desc =
    "Flutter Developer is responsible for running and designing product application features across multiple devices across platforms. Flutter is Google's UI toolkit for building beautiful, natively compiled apps for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

List<PlatformUiSettings> settings = [
  AndroidUiSettings(
    toolbarTitle: 'Cropper',
    toolbarColor: Color(kLightBlue.value),
    toolbarWidgetColor: Colors.white,
    initAspectRatio: CropAspectRatioPreset.ratio4x3,
    lockAspectRatio: true,
  ),
  IOSUiSettings(
    title: 'Cropper',
    resetButtonHidden: false,
    rotateButtonsHidden: false,
    cancelButtonTitle: 'Cancel',
    doneButtonTitle: 'Done',
    aspectRatioLockEnabled: true,
  ),
];
