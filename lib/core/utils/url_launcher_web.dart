import 'dart:html' as html;

void openUrlString(String url, {bool newTab = true}) {
  html.window.open(url, newTab ? '_blank' : '_self');
}

void openMailString(String email, {String subject = "Service Inquiry"}) {
  final encodedSubject = Uri.encodeComponent(subject);
  final gmailUrl =
      'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=$encodedSubject';
  try {
    final win = html.window.open(gmailUrl, '_blank');
    if (win == null) {
      html.window.open('mailto:$email?subject=$encodedSubject', '_blank');
    }
  } catch (_) {
    html.window.open('mailto:$email?subject=$encodedSubject', '_blank');
  }
}

void openTelString(String phone) {
  html.window.open('tel:$phone', '_self');
}
