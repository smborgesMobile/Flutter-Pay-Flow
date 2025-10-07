import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TextStyle? textStyle;
  const LabelButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(label, style: textStyle ?? TextStyles.buttonHeading),
      ),
    );
  }
}
