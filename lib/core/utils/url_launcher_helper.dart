import 'url_launcher_stub.dart'
    if (dart.library.html) 'url_launcher_web.dart';

abstract class UrlLauncherHelper {
  static void launchUrl(String url, {bool newTab = true}) =>
      openUrlString(url, newTab: newTab);

  static void launchEmail(String email, {String subject = "Service Inquiry"}) =>
      openMailString(email, subject: subject);

  static void launchPhone(String phone) => openTelString(phone);
}
