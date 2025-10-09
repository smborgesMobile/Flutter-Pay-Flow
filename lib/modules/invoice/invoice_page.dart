import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/bar_code_counter/bar_code_counter.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: AppColors.primary,
                    height: 80,
                    width: double.maxFinite,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: BarCodeCounter(counter: 1),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsGeometry.directional(start: 24, end: 24),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Meus boletos",
                    style: TextStyles.titleBoldHeading,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Divider(
                  height: 1,
                  color: AppColors.stroke,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
