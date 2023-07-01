import 'package:aba/core/utils/helpers/path_provider_helper/path_provider_helper_interface.dart';
import 'package:path_provider/path_provider.dart';

final class PathProviderImp implements PathProviderHelperInterface {
  @override
  Future<String> getApplicationDocumentsDirectoryPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
}
