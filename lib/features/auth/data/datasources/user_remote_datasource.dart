import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_bnj/features/auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserById(String id);
  Future<List<UserModel>> getUsers();
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  AssetBundle? bundle;
  Map<String, dynamic>? _cachedData;

  UserRemoteDataSourceImpl();

  Future<void> _loadData() async {
    if (_cachedData == null) {
      final assetBundle = bundle ?? rootBundle;
      final jsonString = await assetBundle.loadString(
        'lib/assets/mock-api-data.json',
      );
      _cachedData = json.decode(jsonString);
    }
  }

  @override
  Future<UserModel> getUserById(String id) async {
    await _loadData();
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network

    final List<dynamic> usersJson = _cachedData!['users'];
    final userJson = usersJson.firstWhere(
      (json) => json['id'] == id,
      orElse: () => null,
    );

    if (userJson != null) {
      return UserModel.fromJson(userJson);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    await _loadData();
    await Future.delayed(Duration(milliseconds: 300));
    final List<dynamic> usersJson = _cachedData!['users'];
    return usersJson.map((json) => UserModel.fromJson(json)).toList();
  }
}
