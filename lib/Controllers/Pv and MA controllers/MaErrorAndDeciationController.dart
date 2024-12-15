import 'package:flutter/material.dart';

import '../../Formula Models/PV and Ma Models/MaErrorAndDeviationModel.dart';

class MaErrorAndDeciationController extends ChangeNotifier {
  MaErrorAndDeviationModel model = MaErrorAndDeviationModel();
  TextEditingController entered_StandardMa = TextEditingController();
  TextEditingController entered_Ma_as_found = TextEditingController();

  bool isDeviationComplied = false;
  bool isErrorPercentageComplied = false;

  bool get validateStandardMa => _validateStandardMa();
  bool get validateMa_as_found => _validateMa_as_found();

  update_input_changed() {
    // update display for results everytime when input is changed
    if (validateMa_as_found && validateStandardMa) {
      // calculate deviation
      model.calculate_Deviation(
          double.tryParse(entered_Ma_as_found.text.toString())!,
          double.tryParse(entered_StandardMa.text.toString())!);
      // calculate errorPercentage
      model.calculate_errorPercentage(
          double.tryParse(entered_Ma_as_found.text.toString())!,
          double.tryParse(entered_StandardMa.text.toString())!);
      isDeviationComplied = true;
      isErrorPercentageComplied = true;
    } else {
      isDeviationComplied = false;
      isErrorPercentageComplied = false;
    }

    notifyListeners();
  }

  //validate text form fields

  bool _validateStandardMa() {
    return entered_StandardMa.text.isNotEmpty &&
        double.tryParse(entered_StandardMa.text) != null;
  }

  bool _validateMa_as_found() {
    return entered_Ma_as_found.text.isNotEmpty &&
        double.tryParse(entered_Ma_as_found.text) != null;
  }
}
