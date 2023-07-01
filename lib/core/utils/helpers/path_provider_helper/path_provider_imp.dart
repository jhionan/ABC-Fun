import 'package:aba/core/utils/helpers/path_provider_helper/path_provider_helper_interface.dart';

final class PathProviderImp implements PathProviderHelperInterface {
  @override
  Future<String> getApplicationDocumentsDirectoryPath() async {
    return '';
  }
}
