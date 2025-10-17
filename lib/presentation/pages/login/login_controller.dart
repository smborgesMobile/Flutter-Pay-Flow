import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_project/shared/auth/auth_controller.dart';
import 'package:learning_project/shared/models/user_model.dart';

class LoginController {
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
    final AuthController authController = AuthController();

    try {
      final response = await googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoUrl: response.photoUrl,
      );
      authController.setUser(context, user);
    } catch (error) {
      authController.setUser(context, null);
    }
  }
}
