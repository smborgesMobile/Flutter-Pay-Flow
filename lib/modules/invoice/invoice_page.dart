import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/bar_code_counter/bar_code_counter.dart';
import 'package:learning_project/shared/widgets/invoice_item/invoice_item_widget.dart';
import '../../shared/models/invoice_model.dart' show Invoice;

class InvoicePage extends StatefulWidget {
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
      name: "Fatura de Junho",
      expiredData: "Vence em 15/07",
      currency: "R\$ 300,00",
    ),
    Invoice(
      name: "Fatura de Junho",
      expiredData: "Vence em 15/07",
      currency: "R\$ 300,00",
    ),
    Invoice(
      name: "Fatura de Junho",
      expiredData: "Vence em 15/07",
      currency: "R\$ 300,00",
    ),
  ];

  InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Meus boletos", style: TextStyles.titleBoldHeading),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Divider(height: 1, color: AppColors.stroke, thickness: 1),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.invoices.length,
              itemBuilder: (context, index) {
                final invoice = widget.invoices[index];
                return InvoiceItemWidget(
                  name: invoice.name,
                  expiredData: invoice.expiredData,
                  currency: invoice.currency,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
