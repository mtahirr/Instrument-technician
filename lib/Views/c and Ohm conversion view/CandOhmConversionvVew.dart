import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/C%20and%20ohm%20controller/CandOhmConversionController.dart';
import 'package:provider/provider.dart';
import '../../Global Wigets/GlobalAppBar.dart';
import '../../Global Wigets/GlobalTextfield.dart';

class CandOhmConversionvVew extends StatelessWidget {
  const CandOhmConversionvVew({super.key});

  @override
  Widget build(BuildContext context) {
    CandOhmConversionController controller =
        Provider.of<CandOhmConversionController>(context);
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
              if (controller.SelectedFiltrationOption == "Ohm to C")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: buildTextField(
                    'enter value of ohm',
                    controller.entered_Ohm,
                    (value) => controller.update_input_changed(),
                  ),
                ),
              if (controller.SelectedFiltrationOption == "C to Ohm")
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: buildTextField(
                      'enter value of temperature',
                      controller.entered_temperature,
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
                  'Ohm to C',
                  'C to Ohm',
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
              if (controller.SelectedFiltrationOption == "Ohm to C" &&
                  controller.is_Ohm_to_C_Compiled)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Value of C : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.model.current_calculated_Ohm_to_C
                            .toStringAsFixed(5),
                      ),
                    ],
                  ),
                ),
              if (controller.SelectedFiltrationOption == "C to Ohm" &&
                  controller.is_C_to_Ohm_Compiled)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Value of ohm : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.model.current_calculated_C_to_Ohm
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
