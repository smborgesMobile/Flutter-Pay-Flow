import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/delete_text_button/delete_text_button.dart';

class DeleteBillBottomSheet extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final String billTitle;
  final String billValue;

  const DeleteBillBottomSheet({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.billTitle,
    required this.billValue,
     required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 24),
              child: Text.rich(
                TextSpan(
                  style: TextStyles.titleHeading,
                  children: [
                    const TextSpan(text: 'O boleto '),
                    TextSpan(
                      text: billTitle,
                      style: TextStyles.titleBoldHeading,
                    ),
                    const TextSpan(text: ' no valor de '),
                    TextSpan(
                      text: billValue,
                      style: TextStyles.titleBoldHeading,
                    ),
                    const TextSpan(text: ' foi pago ?'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      textStyle: TextStyles.buttonGray,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Sim'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.shape,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      textStyle: TextStyles.buttonBackground,
                      foregroundColor: AppColors.grey,
                    ),
                    child: Text('Ainda não'),
                  ),
                ),
              ],
            ),
            Divider(height: 24, color: AppColors.stroke, thickness: 1),
            SizedBox(width: 16),
            DeleteTextButton(billTitle: billTitle, onDeleteButtonPressed: (billTitle) {
              onDelete();
            },)
          ],
        ),
      ),
    );
  }
}
