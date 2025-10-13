import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/themes/app_colors.dart';

class DeleteTextButton extends StatelessWidget {
  const DeleteTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.delete_outline,
          color: AppColors.delete,
        ),
        const SizedBox(width: 8), 
        Text(
          'Deletar boleto',
          style: TextStyles.deleteLabel,
        ),
      ],
    );
  }
}
