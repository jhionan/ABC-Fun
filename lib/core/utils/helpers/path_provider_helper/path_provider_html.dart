import 'dart:typed_data';

import 'package:aba/core/utils/helpers/path_provider_helper/path_provider_helper_interface.dart';
import 'dart:html' as html;

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
