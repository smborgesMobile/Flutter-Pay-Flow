import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_images.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';

class BarCodeCounter extends StatelessWidget {
  final int counter;
  const BarCodeCounter({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: AppColors.secondary,
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logomini,
              height: 34,
              width: 56,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 12),
            Container(width: 1, height: 40, color: AppColors.shape),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'Você tem ',
                  style: TextStyles.captionBackground,
                  children: [
                    TextSpan(
                      text: '$counter ${counter == 1 ? "boleto" : "boletos"} ',
                      style: TextStyles.captionBoldBackground,
                    ),
                    TextSpan(
                      text: counter == 1
                          ? 'cadastrado para pagar!'
                          : 'cadastrados para pagar!',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
