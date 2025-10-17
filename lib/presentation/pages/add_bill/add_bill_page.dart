import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:learning_project/presentation/blocs/bill_cubit.dart';
import 'package:learning_project/presentation/blocs/bill_form_cubit.dart';
import 'package:learning_project/shared/models/bill_model.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/add_bill_field/add_bill_field_widget.dart';
import 'package:learning_project/shared/widgets/set_buttons/set_buttons_widget.dart';

class AddBillPage extends StatelessWidget {
  const AddBillPage({super.key});

  void addBill(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final dateController = MaskedTextController(mask: '00/00/0000');
    final billNameController = TextEditingController();
    final valueControlelr = TextEditingController();
    final codeController = TextEditingController();
    final cubit = context.read<BillCubit>();
    return BlocProvider(
      create: (_) => BillFormCubit(),
      child: SafeArea(
        top: false,
        child: Scaffold(
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
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: BlocBuilder<BillFormCubit, BillFormState>(
                  builder: (context, state) {
                    return AddBillFieldWidget(
                      hint: "Nome do boleto",
                      icon: Icons.document_scanner_outlined,
                      fieldType: "text",
                      controller: billNameController,
                      onChanged: (v) => context.read<BillFormCubit>().nameChanged(v),
                      errorText: state.nameError,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
                child: BlocBuilder<BillFormCubit, BillFormState>(
                  builder: (context, state) {
                    return AddBillFieldWidget(
                      hint: "Vencimento",
                      icon: Icons.delete_outline,
                      fieldType: "date",
                      controller: dateController,
                      onChanged: (v) => context.read<BillFormCubit>().dateChanged(v),
                      errorText: state.dateError,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
                child: BlocBuilder<BillFormCubit, BillFormState>(
                  builder: (context, state) {
                    return AddBillFieldWidget(
                      hint: "Valor",
                      icon: Icons.wallet_travel_outlined,
                      fieldType: "value",
                      controller: valueControlelr,
                      onChanged: (v) => context.read<BillFormCubit>().valueChanged(v),
                      errorText: state.valueError,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
                child: BlocBuilder<BillFormCubit, BillFormState>(
                  builder: (context, state) {
                    return AddBillFieldWidget(
                      hint: "Código",
                      icon: Icons.bar_chart_outlined,
                      fieldType: "code",
                      controller: codeController,
                      onChanged: (v) => context.read<BillFormCubit>().codeChanged(v),
                      errorText: state.codeError,
                    );
                  },
                ),
              ),
              Spacer(),
              BlocBuilder<BillFormCubit, BillFormState>(
                builder: (context, state) {
                  return SetLabelButtons(
                    labelPrimary: "Cancelar",
                    onTapPrimary: () {
                      Navigator.pop(context);
                    },
                    labelSecondary: "Cadastrar",
                    onTapSecondary: () {
                      final boleto = Bill(
                        nome: billNameController.text,
                        date: dateController.text,
                        value: valueControlelr.text,
                        code: codeController.text,
                      );

                      if (state.isValid) {
                        cubit.addBill(boleto);
                        billNameController.clear();
                        dateController.clear();
                        valueControlelr.clear();
                        codeController.clear();

                        Navigator.pop(context);
                      }
                    },
                    enablePrimaryColor: false,
                    enableSecondaryColor: state.isValid,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}