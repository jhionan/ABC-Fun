import 'dart:io';
import 'dart:typed_data';

import 'package:abc_fun/core/utils/helpers/path_provider_helper/path_provider_helper_interface.dart';
import 'package:path_provider/path_provider.dart';

final class PathProviderImp implements PathProviderHelperInterface {
  @override
  Future<String> getApplicationDocumentsDirectoryPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  @override
  Future<Uint8List> getBytesFromFilePath(String filePath) {
    return File(filePath).readAsBytes();
  }
}
