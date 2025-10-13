import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';

class InvoiceItemWidget extends StatelessWidget {
  final String name;
  final String expiredData;
  final String currency;
  final VoidCallback? onTap;

  const InvoiceItemWidget({
    super.key,
    required this.name,
    required this.expiredData,
    required this.currency,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
