import 'package:url_launcher/url_launcher.dart';

class MailAppLauncher {
  Future<void> launchMailApp({
    required String candidateEmail,
  }) async {
    final url = Uri.parse('mailto:$candidateEmail');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
