import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../constants/portfolio_data.dart';

Future<void> downloadResumeFile() async {
  const String assetPath = PortfolioData.resumePdfAssetPath;
  const String downloadFileName = PortfolioData.resumePdfFileName;

  try {
    // Read the binary asset using Flutter rootBundle
    final byteData = await rootBundle.load(assetPath);
    final bytes = byteData.buffer.asUint8List();

    // Create Blob with PDF mime type
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create hidden anchor element and trigger download
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', downloadFileName)
      ..style.display = 'none';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    debugPrint('Blob download error: $e. Falling back to direct URL.');

    // Fallback: Direct file download
    final anchor = html.AnchorElement(href: downloadFileName)
      ..setAttribute('download', downloadFileName)
      ..setAttribute('target', '_blank')
      ..style.display = 'none';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
  }
}
