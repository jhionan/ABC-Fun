import 'package:abc_fun/core/data/appwrite_client.dart';
import 'package:abc_fun/core/domain/repositories/user_repository.dart';
import 'package:appwrite/models.dart';

class UserRepositoryImp implements UserRepository {
  AppwriteClient appwriteClient;
  UserRepositoryImp({
    required this.appwriteClient,
  });

  @override
  Future<User?> login() async {
    return await appwriteClient.login();
  }

  @override
  Future<void> logout() async {
    await appwriteClient.logout();
  }

  @override
  Future<Session?> annonymousLogin() async {
    return await appwriteClient.annonymousLogin();
  }

  @override
  Future<void> logoutAllDevices() async {
    await appwriteClient.logoutAllDevices();
  }

  @override
  Future<User?> getUser() async {
    try {
      return appwriteClient.getUser();
    } catch (e) {
      return null;
    }
  }
}
