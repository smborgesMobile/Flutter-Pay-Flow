import 'package:learning_project/data/models/user_model.dart';

/// Domain-level interface for user repository.
/// Use this interface in domain/usecases and presentation layers so implementations
/// in `data/` can be swapped or mocked easily.
abstract class IUserRepository {
  Future<List<UserModel>> getUsers();
}
