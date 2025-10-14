import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/blocs/bill_cubit.dart';
import 'package:learning_project/shared/models/bill_model.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/bar_code_counter/bar_code_counter.dart';
import 'package:learning_project/shared/widgets/invoice_list/invoice_list_widget.dart';
import 'package:learning_project/shared/widgets/delete_bill_bottom_sheet/delete_bill_bottom_sheet.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BillCubit>();
    return SingleChildScrollView(
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

          BlocBuilder<BillCubit, List<Bill>>(
            builder: (context, bills) {
              List<Bill> getUnpaidBills = context
                  .read<BillCubit>()
                  .getUnpaidBills();
              if (getUnpaidBills.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: Text("Nenhum boleto encontrado.")),
                );
              }

              return InvoiceListWidget(
                invoices: getUnpaidBills,
                onItemTap: (bill) async {
                  final bool? result = await showModalBottomSheet<bool>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return DeleteBillBottomSheet(
                        billTitle: bill.nome,
                        billValue: bill.value,
                        onConfirm: () {
                          Navigator.of(context).pop(true);
                          cubit.markBillAsPaid(bill);
                        },
                        onCancel: () {
                          Navigator.of(context).pop();
                        },
                        onDelete: () {
                          Navigator.of(context).pop(false);
                          cubit.deleteBill(bill);
                        },
                      );
                    },
                  );

                  if (result == true) {
                    // Usuário confirmou que o boleto foi pago
                    // Atualize seu estado ou banco de dados
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
