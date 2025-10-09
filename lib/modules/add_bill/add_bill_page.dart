import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';

class AddBillPage extends StatelessWidget {
  const AddBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: AppColors.secondary)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 92, right: 92),
            child: Text(
              "Preenche os dados do Boleto",
              style: TextStyles.titleBoldHeading,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
