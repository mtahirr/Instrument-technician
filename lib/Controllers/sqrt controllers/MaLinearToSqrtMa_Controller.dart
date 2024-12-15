import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/srqt%20models/MaLinearToSqrtMa_model.dart';

class MaLinearToSqrtMa_controller extends ChangeNotifier {
  TextEditingController entered_URV = TextEditingController();
  TextEditingController entered_LRV = TextEditingController();
  TextEditingController entered_linear_input_ma = TextEditingController();
  bool isSpanComplied = false;
  bool areAllLinearwithSpanComplied = false;
  bool isOnlyLinearComplied = false;
  MaLinearToSqrtMa_model model = MaLinearToSqrtMa_model();

  bool get validateLRV => _validateLrvData();
  bool get validateURV => _validateUrvData();
  bool get validateLinearInputMa => _validateLinearInputMa();

  ontextfieldchanged() {
    if (validateLRV && validateURV) {
      model.calculate_span(double.tryParse(entered_LRV.text)!,
          double.tryParse(entered_URV.text)!);
      isSpanComplied = true;
    } else {
      isSpanComplied = false;
      areAllLinearwithSpanComplied = false;
    }

    if (isSpanComplied && validateLinearInputMa) {
      // all the below calculations are dependent on linear input ma
      model.calculate_linearOutputPercentage(
          double.tryParse(entered_linear_input_ma.text)!);

      model.calculate_linearPv(
          model.calculate_linearOutputPercentage(
              double.tryParse(entered_linear_input_ma.text)!),
          model.calculate_span(double.tryParse(entered_LRV.text)!,
              double.tryParse(entered_URV.text)!));

      model.calculate_sqrtOutputMA(
          double.tryParse(entered_linear_input_ma.text)!);

      model.calculate_srqtOutputPerc(
        model.calculate_linearOutputPercentage(
            double.tryParse(entered_linear_input_ma.text)!),
      );
      model.calculate_sqrtPv(
          model.calculate_srqtOutputPerc(
            model.calculate_linearOutputPercentage(
                double.tryParse(entered_linear_input_ma.text)!),
          ),
          model.calculate_span(double.tryParse(entered_LRV.text)!,
              double.tryParse(entered_URV.text)!),
          double.tryParse(entered_LRV.text)!);

      areAllLinearwithSpanComplied = true;
    } else if (validateLinearInputMa) {
      model.calculate_linearOutputPercentage(
          double.tryParse(entered_linear_input_ma.text)!);

      model.calculate_sqrtOutputMA(
          double.tryParse(entered_linear_input_ma.text)!);

      model.calculate_srqtOutputPerc(
        model.calculate_linearOutputPercentage(
            double.tryParse(entered_linear_input_ma.text)!),
      );
      isOnlyLinearComplied = true;
    } else {
      isOnlyLinearComplied = false;
      areAllLinearwithSpanComplied = false;
    }
    notifyListeners();
  }

  // validations for input text editing controllers
  bool _validateLrvData() {
    return entered_LRV.text.isNotEmpty &&
        double.tryParse(entered_LRV.text) != null;
  }

  bool _validateUrvData() {
    return entered_URV.text.isNotEmpty &&
        double.tryParse(entered_URV.text) != null;
  }

  _validateLinearInputMa() {
    return entered_linear_input_ma.text.isNotEmpty &&
        double.tryParse(entered_linear_input_ma.text) != null;
  }
}
