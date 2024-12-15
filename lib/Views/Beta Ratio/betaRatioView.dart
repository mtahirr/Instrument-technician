import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/Beta%20ratio%20controllers/betaRatioController.dart';
import 'package:provider/provider.dart';

import '../../Global Wigets/GlobalAppBar.dart';
import '../../Global Wigets/GlobalTextfield.dart';

class betaRatioView extends StatelessWidget {
  const betaRatioView({super.key});
  @override
  Widget build(BuildContext context) {
    betaRatioController controller = Provider.of<betaRatioController>(context);

    return Scaffold(
      appBar: GlobalAppBar("Beta Ratio", context, () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // condition to display LRV input field
              if (controller.SelectedFiltrationOption == "Beta ratio")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: buildTextField(
                      'enter internal dia orfice plate',
                      controller.entered_internalDiaOrficePlate,
                      (value) => controller.update_input_changed()),
                ),
              if (controller.SelectedFiltrationOption == "Beta ratio" ||
                  controller.SelectedFiltrationOption == "Pipe internal dia")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: buildTextField(
                      'enter internal dia of pipe',
                      controller.entered_internalDiaOfPipe,
                      (value) => controller.update_input_changed()),
                ),
              if (controller.SelectedFiltrationOption == "Pipe internal dia")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: buildTextField(
                      'enter beta ration',
                      controller.entered_BetaRation,
                      (value) => controller.update_input_changed()),
                ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: controller.SelectedFiltrationOption,
                onChanged: (String? newValue) {
                  controller.updatefilterationOption(newValue);
                },
                items: <String>[
                  'Select',
                  'Beta ratio',
                  'Pipe internal dia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Results:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              // display value of span
              if (controller.SelectedFiltrationOption == "Beta ratio" &&
                  controller.isBetaRatioCompiled)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Value of Beta ratio : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.model.current_calculated_beta_ratio_value
                            .toStringAsFixed(5),
                      ),
                    ],
                  ),
                ),
              if (controller.SelectedFiltrationOption == "Pipe internal dia" &&
                  controller.isPipeInternalDiaCompiled)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Value of Pipe internal dia : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller
                            .model.current_calculated_Pipe_internal_dia_value
                            .toStringAsFixed(5),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
