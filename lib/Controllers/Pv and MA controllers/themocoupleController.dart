import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/PV%20and%20Ma%20Models/ThermocouplecalculationModel.dart';

class themocouplecontroller extends ChangeNotifier {
  thermocoupleCalculationModel model = thermocoupleCalculationModel();
  String SelectedFiltrationOption = "Select";
  TextEditingController entered_MV_Ktype = TextEditingController();
  TextEditingController entered_MV_Jtype = TextEditingController();
  TextEditingController entered_Ab_temp_Ktype = TextEditingController();
  TextEditingController entered_Ab_temp_Jtype = TextEditingController();

  bool istemp_K_typeComplied = false;
  bool istemp_J_typeComplied = false;

  bool get validateMv_Ktype => _validateMv_Ktype();
  bool get validateMv_Jtype => _validateMv_Jtype();

  bool get validate_ABtemp_Ktype => _validate_ABtemp_Ktype();
  bool get validate_ABtemp_Jtype => _validate_ABtemp_Jtype();

  updatefilterationOption(String updatedfilter) {
    SelectedFiltrationOption = updatedfilter;
    notifyListeners();
  }

  textFieldsUpdated() {
    if (SelectedFiltrationOption == "Temp (J-type)") {
      if (validateMv_Jtype && validate_ABtemp_Jtype) {
        model.tempJtype(double.tryParse(entered_MV_Jtype.text.toString())!,
            double.tryParse(entered_Ab_temp_Jtype.text.toString())!);
        istemp_J_typeComplied = true;
      } else {
        istemp_J_typeComplied = false;
      }
    } else if (SelectedFiltrationOption == "Temp (K-type)") {
      if (validateMv_Ktype && validate_ABtemp_Ktype) {
        model.tempKtype(
          double.tryParse(entered_MV_Ktype.text.toString())!,
          double.tryParse(entered_Ab_temp_Ktype.text.toString())!,
        );
        istemp_K_typeComplied = true;
      } else {
        istemp_K_typeComplied = false;
      }
    } else {
      istemp_J_typeComplied = false;
      istemp_K_typeComplied = false;
    }
    notifyListeners();
  }

  bool _validateMv_Ktype() {
    return entered_MV_Ktype.text.isNotEmpty &&
        double.tryParse(entered_MV_Ktype.text) != null;
  }

  bool _validateMv_Jtype() {
    return entered_MV_Jtype.text.isNotEmpty &&
        double.tryParse(entered_MV_Jtype.text) != null;
  }

  bool _validate_ABtemp_Ktype() {
    return entered_Ab_temp_Ktype.text.isNotEmpty &&
        double.tryParse(entered_Ab_temp_Ktype.text) != null;
  }

  bool _validate_ABtemp_Jtype() {
    return entered_Ab_temp_Jtype.text.isNotEmpty &&
        double.tryParse(entered_Ab_temp_Jtype.text) != null;
  }
}
