import 'dart:convert';

import 'package:http/http.dart';
import 'package:learning_project/data/models/user_model.dart';
import 'package:learning_project/domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';

  @override
  Future<List<UserModel>> getUsers() async {
    final Map<String, String> customHeaders = {
      'Content-Type': 'application/json',
      'x-api-key': 'reqres-free-v1',
    };

    Response response = await get(Uri.parse(userUrl), headers: customHeaders);
    if (response.statusCode == 200) {
      final List<UserModel> users = jsonDecode(
        response.body,
      )['data'].map<UserModel>((user) => UserModel.fromJson(user)).toList();

      return users;
    } else {
      print(
        '❌ [UserRepository] Falha ao carregar usuários.'
        ' statusCode=${response.statusCode} '
        'reason=${response.reasonPhrase}',
      );

      throw Exception(
        'Failed to load users: ${response.statusCode} ${response.reasonPhrase}',
      );
    }
  }
}
