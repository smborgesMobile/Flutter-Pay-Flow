import 'package:flutter/material.dart';
import 'package:learning_project/shared/models/invoice_model.dart';
import 'package:learning_project/shared/widgets/invoice_item/invoice_item_widget.dart';

class InvoiceListWidget extends StatelessWidget {
  final List<Invoice> invoices = [
    Invoice(
      name: "Fatura de Abril",
      expiredData: "Venceu em 01/05",
      currency: "R\$ 200,00",
    ),
    Invoice(
      name: "Fatura de Maio",
      expiredData: "Vence em 02/06",
      currency: "R\$ 150,00",
    ),
    Invoice(
      name: "Fatura de Junho",
      expiredData: "Vence em 15/07",
      currency: "R\$ 300,00",
    ),
    Invoice(
      name: "Fatura de Julho",
      expiredData: "Vence em 15/07",
      currency: "R\$ 400,00",
    ),
    Invoice(
      name: "Fatura de Agosto",
      expiredData: "Vence em 15/07",
      currency: "R\$ 500,00",
    ),
    Invoice(
      name: "Fatura de Setembro",
      expiredData: "Vence em 15/07",
      currency: "R\$ 800,00",
    ),
        Invoice(
      name: "Fatura de Setembro",
      expiredData: "Vence em 15/07",
      currency: "R\$ 800,00",
    ),
        Invoice(
      name: "Fatura de Setembro",
      expiredData: "Vence em 15/07",
      currency: "R\$ 800,00",
    ),
  ];

  InvoiceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: invoices
          .map(
            (invoice) => InvoiceItemWidget(
              name: invoice.name,
              expiredData: invoice.expiredData,
              currency: invoice.currency,
            )
          )
          .toList(),
    );
  }
}
