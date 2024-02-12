import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_response.dart';

Future<void> setCache(LoginResponse response) async {
  token = response.token;
  userId = response.userData!.id!;
  userImage = response.userData!.imageUrl ?? defaultImage;
  isAdmin = response.userData!.isAdmin!;
  await Future.wait([
    CacheHelper.setData(key: 'token', value: response.token),
    CacheHelper.setData(key: 'userId', value: response.userData!.id),
    CacheHelper.setData(
        key: 'userImage', value: response.userData!.imageUrl ?? defaultImage),
    CacheHelper.setData(key: 'isAdmin', value: response.userData!.isAdmin),
  ]);
}

Future<void> getCache() async {
  firstTime = await CacheHelper.getData(key: 'firstTime') ?? true;
  token = await CacheHelper.getData(key: 'token') ?? '';
  userId = await CacheHelper.getData(key: 'userId') ?? '';
  userImage = await CacheHelper.getData(key: 'userImage') ?? defaultImage;
  isAdmin = await CacheHelper.getData(key: 'isAdmin') ?? false;
}

Future<void> removeCache() async {
  await CacheHelper.setData(key: 'firstTime', value: false);
  await CacheHelper.removeData(key: 'token');
  await CacheHelper.removeData(key: 'userId');
  await CacheHelper.removeData(key: 'userImage');
}
