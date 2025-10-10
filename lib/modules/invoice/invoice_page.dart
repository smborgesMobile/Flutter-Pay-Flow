import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/blocs/bill_cubit.dart';
import 'package:learning_project/shared/models/bill_model.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/bar_code_counter/bar_code_counter.dart';
import 'package:learning_project/shared/widgets/invoice_list/invoice_list_widget.dart';

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

              return InvoiceListWidget(invoices: getUnpaidBills);
            },
          ),
        ],
      ),
    );
  }
}
