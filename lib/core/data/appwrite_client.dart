import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:window_location_href/window_location_href.dart';

class AppwriteClient {
  AppwriteClient() {
    _init();
  }
  final Uri? location = href == null ? null : Uri.parse(href!);

  late Client _client;
  String? _userId;
  void _init() {
    _client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
        .setProject('64a24b3f19e937584841') // Your project ID
        .setSelfSigned(); // Use only on dev mode with a self-signed SSL cert
  }

  Account get _account => Account(_client);

  Databases get databases => Databases(_client);

  Storage get storage => Storage(_client);

  Future<String> get userId async {
    _userId ??= await _account.get().then((value) => value.$id);
    return _userId!;
  }

  logout() {
    _userId = null;
    _account.deleteSession(sessionId: 'current');
  }

  logoutAllDevices() {
    _userId = null;
    _account.deleteSessions();
  }

  Future<User?> login() async {
    try {
      return await _getUserAndSetId();
    } catch (_) {}
    try {
      await _account.createOAuth2Session(provider: 'google', success: kIsWeb ? '${location?.origin}/auth.html' : null);
      return await _getUserAndSetId();
    } catch (e) {
      return null;
    }
  }

  Future<User> _getUserAndSetId() async {
    var user = await _account.get();
    _userId = user.$id;
    debugPrint('User Logged in: ${user.name} ${user.email}');
    return user;
  }

  Future<Session?> annonymousLogin() async {
    try {
      await _getUserAndSetId();
      return null;
    } catch (_) {}
    try {
      return _account.createAnonymousSession();
    } catch (_) {
      return null;
    }
  }

  final String dataBaseId = ID.custom('abc-database');
  final String settingsBucketId = ID.custom('settings-bucket');
  final String actionsBucketId = ID.custom('actions-bucket');

  List<String> defaultPermissions(String userId) => [
        Permission.read(Role.user(userId)),
        Permission.write(Role.user(userId)),
        Permission.update(Role.user(userId)),
        Permission.delete(Role.user(userId))
      ];

  Future<User?> getUser() {
    return _getUserAndSetId();
  }
}

extension UserExtension on User? {
 bool get isLogged => this!=null && this!.email.isNotEmpty && this!.emailVerification;
 bool get isAnnonymous => this!=null && this!.email.isEmpty;
}

enum Collection {
  settings,
  actions,
  gameSessions;

  @override
  String toString() => name;
}
