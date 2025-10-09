import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/add_bill_field/add_bill_field_widget.dart';
import 'package:learning_project/shared/widgets/set_buttons/set_buttons_widget.dart';

class AddBillPage extends StatelessWidget {
  const AddBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: AddBillFieldWidget(
                hint: "Nome do boleto",
                icon: Icons.document_scanner_outlined,
                fieldType: "text",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
              child: AddBillFieldWidget(
                hint: "Vencimento",
                icon: Icons.delete_outline,
                fieldType: "date",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
              child: AddBillFieldWidget(
                hint: "Valor",
                icon: Icons.wallet_travel_outlined,
                fieldType: "value", // Para valor monetário
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
              child: AddBillFieldWidget(
                hint: "Código",
                icon: Icons.bar_chart_outlined,
                fieldType: "code",
              ),
            ),
            Spacer(),
            SetLabelButtons(
              labelPrimary: "Cancelar",
              onTapPrimary: () {
                Navigator.pop(context);
              },
              labelSecondary: "Cadastrar",
              onTapSecondary: () {},
              enablePrimaryColor: false,
              enableSecondaryColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
