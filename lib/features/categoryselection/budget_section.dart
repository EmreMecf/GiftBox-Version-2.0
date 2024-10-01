import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BudgetSection extends StatefulWidget {
  final String? minBudget;
  final String? maxBudget;
  final Function(String value) onMinBudgetChanged;
  final Function(String value) onMaxBudgetChanged;

  const BudgetSection({
    Key? key,
    required this.minBudget,
    required this.maxBudget,
    required this.onMinBudgetChanged,
    required this.onMaxBudgetChanged,
  }) : super(key: key);

  @override
  _BudgetSectionState createState() => _BudgetSectionState();
}

class _BudgetSectionState extends State<BudgetSection> {
  late TextEditingController _minBudgetController;
  late TextEditingController _maxBudgetController;
  String? _minError;
  String? _maxError;

  @override
  void initState() {
    super.initState();
    _minBudgetController = TextEditingController(text: widget.minBudget);
    _maxBudgetController = TextEditingController(text: widget.maxBudget);
  }

  @override
  void dispose() {
    _minBudgetController.dispose();
    _maxBudgetController.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      _minError = null;
      _maxError = null;

      // Minimum bütçe kontrolü
      if (_minBudgetController.text.isNotEmpty) {
        final minValue = double.tryParse(_minBudgetController.text);
        if (minValue == null || minValue < 0) {
          _minError =
              AppLocalizations.of(context)!.category_budget_min_error_label;
        } else {
          widget.onMinBudgetChanged(_minBudgetController.text);
        }
      }

      // Maksimum bütçe kontrolü
      if (_maxBudgetController.text.isNotEmpty) {
        final maxValue = double.tryParse(_maxBudgetController.text);
        if (maxValue == null || maxValue < 0) {
          _maxError =
              AppLocalizations.of(context)!.category_budget_max_error_label;
        } else {
          widget.onMaxBudgetChanged(_maxBudgetController.text);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.category_budget_heading,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minBudgetController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .category_budget_min_label,
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: _minError,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _validateInput();
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _maxBudgetController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .category_budget_max_label,
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: _maxError,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _validateInput();
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
