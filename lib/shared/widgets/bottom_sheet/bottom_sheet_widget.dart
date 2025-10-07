import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/set_buttons/set_buttons_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  final String title;
  final String description;

  const BottomSheetWidget({
    super.key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          color: AppColors.shape,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container(color: Colors.black.withAlpha(50))),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: title,
                    style: TextStyles.buttonBoldHeading,
                    children: [
                      TextSpan(
                        text: "\n$description",
                        style: TextStyles.buttonHeading,
                      ),
                    ],
                  ),
                ),
              ),
              Container(height: 1, color: AppColors.stroke),
              SetButtonsWidget(
                enablePrimarycolor: true,
                primaryLabel: primaryLabel,
                secondaryLabel: secondaryLabel,
                primaryOnPressed: primaryOnPressed,
                secondaryOnPressed: secondaryOnPressed,
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
