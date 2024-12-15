import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/Pv and MA controllers/themocoupleController.dart';
import '../../../Global Wigets/GlobalAppBar.dart';

class thermoCoupleCalculation extends StatelessWidget {
  const thermoCoupleCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    themocouplecontroller datacontroller =
        Provider.of<themocouplecontroller>(context);
    return Scaffold(
      appBar: GlobalAppBar("Thermocouple calculation", context, () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              if (datacontroller.SelectedFiltrationOption == "Temp (J-type)")
                Column(
                  children: [
                    _buildTextField(
                        'MV (J-type)',
                        datacontroller.entered_MV_Jtype,
                        (value) => datacontroller.textFieldsUpdated()),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildTextField(
                        'AB temp (J-type)',
                        datacontroller.entered_Ab_temp_Jtype,
                        (value) => datacontroller.textFieldsUpdated()),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              if (datacontroller.SelectedFiltrationOption == "Temp (K-type)")
                Column(
                  children: [
                    _buildTextField(
                        'MV (k-type)',
                        datacontroller.entered_MV_Ktype,
                        (value) => datacontroller.textFieldsUpdated()),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildTextField(
                        'AB temp (K-type)',
                        datacontroller.entered_Ab_temp_Ktype,
                        (value) => datacontroller.textFieldsUpdated()),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              DropdownButton<String>(
                value: datacontroller.SelectedFiltrationOption,
                onChanged: (String? newValue) {
                  datacontroller.updatefilterationOption(newValue!);
                },
                items: datacontroller.model.Filtration_Options
                    .map<DropdownMenuItem<String>>((String value) {
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
              if (datacontroller.SelectedFiltrationOption == "Temp (J-type)" &&
                  datacontroller.istemp_J_typeComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Temp (J-type) : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(datacontroller.model.current_calculated_tempJtype
                          .toStringAsFixed(2)),
                    ],
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              if (datacontroller.SelectedFiltrationOption == "Temp (K-type)" &&
                  datacontroller.istemp_K_typeComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Temp (K-type) : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(datacontroller.model.current_calculated_tempKtype
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

typedef void TextFieldChangeCallback(String lable);
