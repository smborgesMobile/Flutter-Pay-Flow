import 'package:flutter/widgets.dart';
import 'package:learning_project/shared/auth/auth_controller.dart';
import 'package:learning_project/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  var currentPage = 0;
  final AuthController authController = AuthController();

  void setPage(int index) {
    if (currentPage != index) {
      currentPage = index;
    }
  }

  Future<UserModel?> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      return UserModel.fromJson(json);
    }
    return null;
  }
}
