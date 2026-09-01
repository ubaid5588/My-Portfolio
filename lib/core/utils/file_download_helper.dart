import 'file_download_stub.dart'
    if (dart.library.html) 'file_download_web.dart';

abstract class FileDownloadHelper {
  static Future<void> downloadResume() => downloadResumeFile();
}
