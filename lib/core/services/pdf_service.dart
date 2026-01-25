import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';

/// Service for handling PDF operations
class PdfService {
  /// Save PDF bytes to file
  Future<String?> savePdf({
    required List<int> bytes,
    required String fileName,
  }) async {
    try {
      // Get application documents directory (no permission needed for app's private directory)
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      // Write bytes to file
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      return filePath;
    } catch (e) {
      return null;
    }
  }

  /// Share PDF file
  Future<bool> sharePdf({
    required String filePath,
    String? subject,
    String? text,
  }) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return false;
      }

      final xFile = XFile(filePath);
      await Share.shareXFiles(
        [xFile],
        subject: subject,
        text: text,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Download and share PDF from bytes
  Future<bool> downloadAndSharePdf({
    required List<int> bytes,
    required String fileName,
    String? subject,
    String? text,
  }) async {
    try {
      final filePath = await savePdf(
        bytes: bytes,
        fileName: fileName,
      );

      if (filePath == null) {
        return false;
      }

      return await sharePdf(
        filePath: filePath,
        subject: subject,
        text: text,
      );
    } catch (e) {
      return false;
    }
  }
}
