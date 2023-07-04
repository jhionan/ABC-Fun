import 'package:appwrite/models.dart';

abstract interface class UserRepository {
  Future<User?> getUser();
  Future<User?> login();
  Future<void> logout();
  Future<void> logoutAllDevices();
  Future<Session?> annonymousLogin();
}
