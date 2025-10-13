import 'package:flutter/material.dart';
import 'package:learning_project/shared/models/bill_model.dart';
import 'package:learning_project/shared/widgets/invoice_item/invoice_item_widget.dart';

class InvoiceListWidget extends StatelessWidget {
  final List<Bill> invoices;
  final Function(Bill) onItemTap;
  
  const InvoiceListWidget({
    super.key, 
    required this.invoices,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: invoices
          .map(
            (invoice) => InvoiceItemWidget(
              name: invoice.nome,
              expiredData: "Vence em ${invoice.date}",
              currency: invoice.value,
              onTap: () => onItemTap(invoice),
            ),
          )
          .toList(),
    );
  }
}