import 'dart:html' as html;

void openUrlString(String url, {bool newTab = true}) {
  html.window.open(url, newTab ? '_blank' : '_self');
}

void openMailString(String email) {
  html.window.open('mailto:$email', '_self');
}

void openTelString(String phone) {
  html.window.open('tel:$phone', '_self');
}
