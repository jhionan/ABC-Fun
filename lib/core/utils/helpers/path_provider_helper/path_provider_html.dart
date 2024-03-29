import 'dart:typed_data';

import 'package:abc_fun/core/utils/helpers/path_provider_helper/path_provider_helper_interface.dart';

final class PathProviderImp implements PathProviderHelperInterface {
  @override
  Future<String> getApplicationDocumentsDirectoryPath() async {
    return '';
  }

  @override
  Future<Uint8List> getBytesFromFilePath(String filePath) async {
    return Uint8List.fromList([]); // Uint8List fileData = html.FileEntry();
  }
}
