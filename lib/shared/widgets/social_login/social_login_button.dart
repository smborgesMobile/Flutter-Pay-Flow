import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_images.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.stroke),
          borderRadius: BorderRadius.circular(5),
          color: AppColors.shape,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16),
                Image.asset(AppImages.google),
                SizedBox(width: 16),
                Container(height: 56, width: 1, color: AppColors.stroke),
              ],
            ),
            Center(
              child: Text("Entrar com o Google", style: TextStyles.buttonGray),
            ),
          ],
        ),
      ),
    );
  }
}
