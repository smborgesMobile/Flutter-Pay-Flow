import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';

class InvoiceItemWidget extends StatelessWidget {
  final String name;
  final String expiredData;
  final String currency;

  const InvoiceItemWidget({
    super.key,
    required this.name,
    required this.expiredData,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyles.titleBoldHeading,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(currency, style: TextStyles.buttonHeading),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 4),
          child: Text(
            expiredData,
            style: TextStyles.captionBody,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 24)
      ],
    );
  }
}
