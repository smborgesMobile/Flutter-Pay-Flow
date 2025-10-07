import 'package:flutter/material.dart';
import 'package:learning_project/modules/login/login_controller.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_images.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.30,
            width: size.width,
            color: AppColors.primary,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  const SizedBox(height: 45),
                  Stack(
                    children: [
                      Image.asset(
                        AppImages.person,
                        width: 208,
                        height: size.height * 0.3,
                        fit: BoxFit.scaleDown,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withValues(alpha: .0),
                                Colors.white.withValues(alpha: .2),
                                Colors.white.withValues(alpha: .5),
                                Colors.white.withValues(alpha: .8),
                                Colors.white,
                              ],
                            ),
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Image.asset(AppImages.logomini),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SocialLoginButton(
                      onTap: () {
                        controller.googleSignIn(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
