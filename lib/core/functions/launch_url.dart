import 'package:url_launcher/url_launcher_string.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';

Future<void> launchMyUrl(context, String? url) async {
  if (url != null) {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
    } else {
      showCustomSnackBar(context, 'Can`t launch url');
    }
  } else {
    showCustomSnackBar(context, 'Url not found');
  }
}
