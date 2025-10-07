import 'package:flutter/material.dart';
import 'package:learning_project/shared/widgets/label_button/label_button.dart';

class SetButtonsWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  const SetButtonsWidget({
    super.key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LabelButton(label: primaryLabel, onPressed: primaryOnPressed),
        ),
        VerticalDivider(),
        Expanded(
          child: LabelButton(
            label: secondaryLabel,
            onPressed: secondaryOnPressed,
          ),
        ),
      ],
    );
  }
}
