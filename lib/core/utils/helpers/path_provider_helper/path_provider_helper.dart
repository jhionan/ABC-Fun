import 'dart:typed_data';

import 'package:aba/core/utils/helpers/path_provider_helper/path_provider_helper_interface.dart';

import 'path_provider_io.dart' if (dart.library.html) 'package:aba/core/utils/helper/path_provider_web.dart';

class PathProviderHelper implements PathProviderHelperInterface {
  @override
  Future<String> getApplicationDocumentsDirectoryPath() async {
    return await PathProviderImp().getApplicationDocumentsDirectoryPath();
  }

  @override
  Future<Uint8List> getBytesFromFilePath(String filePath) async {
        filePath.replaceAll('file://', '');
    return PathProviderImp().getBytesFromFilePath(filePath.replaceAll('file://', ''));
  }
}
