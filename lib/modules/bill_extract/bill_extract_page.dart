import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/invoid_list/invoice_list_widget.dart';

class BillExtractPage extends StatelessWidget {
  const BillExtractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 24),
                child: Text("Meus extratos", style: TextStyles.titleBoldHeading),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, right: 24),
                child: Text("3 pagos", style: TextStyles.captionBody),
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(height: 1, thickness: 1, color: AppColors.stroke),
          SizedBox(height: 32),
          InvoiceListWidget(),
        ],
      ),
    );
  }
}
