import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter_bnj/features/auth/data/datasources/user_remote_datasource.dart';
import 'package:test_flutter_bnj/features/auth/data/models/user_model.dart';
import 'package:test_flutter_bnj/features/auth/domain/repositories/user_repository.dart';

import '../../domain/entities/user.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> getUserById(String id) async {
    try {
      final userModel = await remoteDataSource.getUserById(id);
      return userModel.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }

  @override
  Future<List<User>> getUsers() async {
    try {
      final userModels = await remoteDataSource.getUsers();
      return userModels.map((m) => m.toEntity()).toList();
    } catch (e, s) {
      Logger().e('Error in getUsers: $e');
      Logger().e(s);
      throw Exception('Failed to fetch users: $e');
    }
  }
}