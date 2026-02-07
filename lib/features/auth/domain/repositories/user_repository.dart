import 'package:test_flutter_bnj/features/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<User?> getUserById(String id);
  Future<List<User>> getUsers();
}