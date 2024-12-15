import 'package:flutter/material.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/Pv and MA controllers/PVtoMaController.dart';
import '../../Caibration Calulation VIews/errorpercentage.dart';

class PvToMA extends StatelessWidget {
  const PvToMA({super.key});

  @override
  Widget build(BuildContext context) {
    PvtoMaController pvtoMaController = Provider.of<PvtoMaController>(context);
    return Scaffold(
      appBar: GlobalAppBar("Pv To MA", context, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // condition to display LRV input field
              if (pvtoMaController.SelectedFiltrationOption == "Span" ||
                  pvtoMaController.SelectedFiltrationOption == "Ma to Pv" ||
                  pvtoMaController.SelectedFiltrationOption == "Pv to Ma" ||
                  pvtoMaController.SelectedFiltrationOption == "Pv to %" ||
                  pvtoMaController.SelectedFiltrationOption == "% to Pv")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: _buildTextField('LRV', pvtoMaController.entered_LRV,
                      (value) => pvtoMaController.update_input_changed()),
                ),

              // condition to display URV input field
              if (pvtoMaController.SelectedFiltrationOption == "Span" ||
                  pvtoMaController.SelectedFiltrationOption == "Ma to Pv" ||
                  pvtoMaController.SelectedFiltrationOption == "Pv to Ma" ||
                  pvtoMaController.SelectedFiltrationOption == "Pv to %" ||
                  pvtoMaController.SelectedFiltrationOption == "% to Pv")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: _buildTextField('URV', pvtoMaController.entered_URV,
                      (value) => pvtoMaController.update_input_changed()),
                ),
              // condition to display PV input field
              if (pvtoMaController.SelectedFiltrationOption == "Pv to Ma" ||
                  pvtoMaController.SelectedFiltrationOption == "Pv to %")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: _buildTextField('PV', pvtoMaController.entered_PV,
                      (value) => pvtoMaController.update_input_changed()),
                ),
              // condition to display % input field
              if (pvtoMaController.SelectedFiltrationOption == "% to Pv" ||
                  pvtoMaController.SelectedFiltrationOption == "% to Ma")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: _buildTextField('%', pvtoMaController.entered_Perc,
                      (value) => pvtoMaController.update_input_changed()),
                ),
              // condition to display MA input field
              if (pvtoMaController.SelectedFiltrationOption == "Ma to Pv" ||
                  pvtoMaController.SelectedFiltrationOption == "Ma to %")
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: _buildTextField('MA', pvtoMaController.entered_MA,
                      (value) => pvtoMaController.update_input_changed()),
                ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: pvtoMaController.SelectedFiltrationOption,
                onChanged: (String? newValue) {
                  pvtoMaController.updatefilterationOption(newValue);
                },
                items: <String>[
                  'Select',
                  'Span',
                  'Ma to Pv',
                  'Pv to Ma',
                  'Pv to %',
                  '% to Pv',
                  'Ma to %',
                  '% to Ma',
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
              if (pvtoMaController.SelectedFiltrationOption != "Select" &&
                  pvtoMaController.isSpanComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Value of Span : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Visibility(
                        replacement: InkWell(
                          onTap: () {
                            pvtoMaController.updateSpanVisibility();
                          },
                          child: const Icon(Icons.visibility_off),
                        ),
                        visible:
                            pvtoMaController.SelectedFiltrationOption == "Span"
                                ? true
                                : pvtoMaController.enforceVisibleSpan
                                    ? true
                                    : false,
                        child: Row(
                          children: [
                            Text(
                              pvtoMaController
                                  .model.current_calculated_span_value
                                  .toStringAsFixed(2),
                            ),
                            InkWell(
                              onTap: () {
                                pvtoMaController.updateSpanVisibility();
                              },
                              child: Icon(Icons.visibility),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (pvtoMaController.SelectedFiltrationOption == "Ma to Pv" &&
                  pvtoMaController.isMaToPvComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ma to Pv : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(pvtoMaController
                          .model.current_calculated_MaToPv_value
                          .toStringAsFixed(2)),
                    ],
                  ),
                ),
              if (pvtoMaController.SelectedFiltrationOption == "Pv to Ma" &&
                  pvtoMaController.isPvToMaComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pv to Ma : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(pvtoMaController
                          .model.current_calculated_PvToMa_value
                          .toStringAsFixed(2)),
                    ],
                  ),
                ),
              if (pvtoMaController.SelectedFiltrationOption == "Pv to %" &&
                  pvtoMaController.isPvToPercComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pv to % : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(pvtoMaController
                          .model.current_calculated_PvToPercentage_value
                          .toStringAsFixed(2)),
                    ],
                  ),
                ),
              if (pvtoMaController.SelectedFiltrationOption == "% to Pv" &&
                  pvtoMaController.isPercToPvComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "% to Pv : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(pvtoMaController
                          .model.current_calculated_PercentageToPv_value
                          .toStringAsFixed(2)),
                    ],
                  ),
                ),

              if (pvtoMaController.SelectedFiltrationOption == "Ma to %" &&
                  pvtoMaController.isMaToPercComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ma to % : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(pvtoMaController
                          .model.current_calculated_MaToPercentage_value
                          .toStringAsFixed(2)),
                    ],
                  ),
                ),

              if (pvtoMaController.SelectedFiltrationOption == "% to Ma" &&
                  pvtoMaController.isPercToMaComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "% to Ma : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(pvtoMaController
                          .model.current_calculated_PercentageToMa_value
                          .toStringAsFixed(2)),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      TextFieldChangeCallback callbackAction) {
    return TextField(
      controller: controller,
      onChanged: (_) => callbackAction(labelText),
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 13.3),
        border: OutlineInputBorder(),
      ),
    );
  }
}
