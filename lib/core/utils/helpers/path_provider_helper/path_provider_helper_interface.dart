import 'package:flutter/foundation.dart';

abstract interface class PathProviderHelperInterface {
  Future<String> getApplicationDocumentsDirectoryPath();
  Future<Uint8List> getBytesFromFilePath(String filePath);
}
