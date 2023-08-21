import 'package:intl/intl.dart';

String msgTime(DateTime timeStamp) {
  if (DateTime.now().year == timeStamp.year &&
      DateTime.now().month == timeStamp.month &&
      DateTime.now().day == timeStamp.day) {
    return DateFormat.Hm().format(timeStamp);
  } else if (DateTime.now().year == timeStamp.year &&
      DateTime.now().month == timeStamp.month &&
      DateTime.now().day - timeStamp.day == 1) {
    return 'yesterday at ${DateFormat.Hm().format(timeStamp)}';
  } else {
    return '${DateFormat.yMd().format(timeStamp)} at ${DateFormat.Hm().format(timeStamp)}';
  }
}
