import "package:flutter/material.dart";
import "package:instrumentationapp/Formula%20Models/C%20and%20Ohm%20conversion%20model/CandOhmConversionModel.dart";

class CandOhmConversionController extends ChangeNotifier {
  CandOhmConversionModel model = CandOhmConversionModel();

  TextEditingController entered_temperature = TextEditingController();
  TextEditingController entered_Ohm = TextEditingController();

  String SelectedFiltrationOption = "Select";
  bool is_Ohm_to_C_Compiled = false;
  bool is_C_to_Ohm_Compiled = false;

  updatefilterationOption(updatedfilter) {
    SelectedFiltrationOption = updatedfilter;
    notifyListeners();
  }

  update_input_changed() {
    // update display for results everytime when input is changed

    if (SelectedFiltrationOption == "Ohm to C") {
      if (validateOhm) {
        model.calculate_Ohm_to_C(double.tryParse(entered_Ohm.text)!);
        is_Ohm_to_C_Compiled = true;
      } else {
        is_Ohm_to_C_Compiled = false;
      }
    } else if (SelectedFiltrationOption == "C to Ohm") {
      if (validateTemperature) {
        model.calculate_C_to_Ohm(double.tryParse(entered_temperature.text)!);
        is_C_to_Ohm_Compiled = true;
      } else {
        is_C_to_Ohm_Compiled = false;
      }
    } else {
      is_Ohm_to_C_Compiled = false;
      is_C_to_Ohm_Compiled = false;
    }
    notifyListeners();
  }

  bool get validateTemperature => _validateTemperature();
  bool get validateOhm => _validateOhm();

  bool _validateTemperature() {
    return entered_temperature.text.isNotEmpty &&
        double.tryParse(entered_temperature.text) != null;
  }

  bool _validateOhm() {
    return entered_Ohm.text.isNotEmpty &&
        double.tryParse(entered_Ohm.text) != null;
  }
}
