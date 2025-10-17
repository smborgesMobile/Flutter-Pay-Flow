import 'package:flutter/material.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/add_bill_field/money_input_formatter.dart';

class AddBillFieldWidget extends StatefulWidget {
  final String hint;
  final IconData icon;
  final String fieldType;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const AddBillFieldWidget({
    super.key,
    required this.hint,
    required this.icon,
    required this.fieldType,
    required this.controller,
    this.onChanged,
    this.errorText,
  });

  @override
  State<AddBillFieldWidget> createState() => _AddBillFieldWidgetState();
}

class _AddBillFieldWidgetState extends State<AddBillFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(widget.icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 8),
            Container(width: 1, height: 48, color: AppColors.input),
            Expanded(
              child: TextField(
                controller: widget.controller,
                style: TextStyles.captionBody,
                keyboardType: (widget.fieldType == "code")
                    ? TextInputType.number
                    : TextInputType.text,
                inputFormatters: (widget.fieldType == "value")
                    ? [MoneyInputFormatter()]
                    : [],
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                  contentPadding: const EdgeInsets.only(left: 16, right: 15),
                  errorText: widget.errorText,
                ),
              ),
            ),
          ],
        ),
        Divider(height: 1, thickness: 1, color: AppColors.input),
      ],
    );
  }
}
