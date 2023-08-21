import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/cache_helper.dart';

Future<void> handleCache() async {
  firstTime = await CacheHelper.getData(key: 'firstTime') ?? true;
  token = await CacheHelper.getData(key: 'token') ?? '';
  userId = await CacheHelper.getData(key: 'userId') ?? '';
  userImage = await CacheHelper.getData(key: 'userImage') ?? defaultImage;
}
