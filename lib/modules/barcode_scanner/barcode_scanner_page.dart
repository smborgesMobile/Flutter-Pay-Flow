import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/set_buttons/set_buttons_widget.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Escaneia o código de barras do boleto",
              style: TextStyles.buttonBackground,
            ),
            backgroundColor: Colors.black,
            leading: BackButton(color: AppColors.background),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(child: Container(color: Colors.black)),
              Expanded(flex: 2, child: Container(color: Colors.transparent)),
              Expanded(child: Container(color: Colors.black)),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 56,
            child: SetButtonsWidget(
              primaryLabel: "Inserir código do boleto",
              secondaryLabel: "Adicionar Galeria",
              primaryOnPressed: () {},
              secondaryOnPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
