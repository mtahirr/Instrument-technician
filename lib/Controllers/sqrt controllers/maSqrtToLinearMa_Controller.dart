import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/srqt%20models/MaSqrtToLinearMa_model.dart';

class maSqrtToLinearMa_Controller extends ChangeNotifier {
  TextEditingController entered_URV = TextEditingController();
  TextEditingController entered_LRV = TextEditingController();
  TextEditingController entered_Sqrt_input_ma = TextEditingController();
  bool isSpanComplied = false;
  bool areAllSqrtwithSpanComplied = false;
  bool isOnlySqrtComplied = false;

  MaSqrtToLinearMa_model model = MaSqrtToLinearMa_model();

  bool get validateLRV => _validateLrvData();
  bool get validateURV => _validateUrvData();
  bool get validateSqrtInputMa => _validateSqrtInputMa();

  ontextfieldchanged() {
    if (validateLRV && validateURV) {
      model.calculate_span(double.tryParse(entered_LRV.text)!,
          double.tryParse(entered_URV.text)!);
      isSpanComplied = true;
    } else {
      isSpanComplied = false;
      areAllSqrtwithSpanComplied = false;
    }

    if (isSpanComplied && validateSqrtInputMa) {
      // all the below calculations are dependent on linear input ma
      model.calculate_SqrtOutputPercentage(
          double.tryParse(entered_Sqrt_input_ma.text)!);

      model.calculate_SqrtPv(
          model.calculate_SqrtOutputPercentage(
              double.tryParse(entered_Sqrt_input_ma.text)!),
          model.calculate_span(double.tryParse(entered_LRV.text)!,
              double.tryParse(entered_URV.text)!));

      model.calculate_LinearMA(double.tryParse(entered_Sqrt_input_ma.text)!);

      model.calculate_LinearPercentage(
        model.calculate_LinearMA(double.tryParse(entered_Sqrt_input_ma.text)!),
      );
      model.calculate_LinearPv(
          model.calculate_LinearPercentage(
            model.calculate_LinearMA(
                double.tryParse(entered_Sqrt_input_ma.text)!),
          ),
          model.calculate_span(double.tryParse(entered_LRV.text)!,
              double.tryParse(entered_URV.text)!),
          double.tryParse(entered_LRV.text)!);

      areAllSqrtwithSpanComplied = true;
    } else if (validateSqrtInputMa) {
      model.calculate_SqrtOutputPercentage(
          double.tryParse(entered_Sqrt_input_ma.text)!);

      model.calculate_LinearMA(double.tryParse(entered_Sqrt_input_ma.text)!);

      model.calculate_LinearPercentage(
        model.calculate_LinearMA(double.tryParse(entered_Sqrt_input_ma.text)!),
      );

      isOnlySqrtComplied = true;
    } else {
      isOnlySqrtComplied = false;
      areAllSqrtwithSpanComplied = false;
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

  bool _validateSqrtInputMa() {
    return entered_Sqrt_input_ma.text.isNotEmpty &&
        double.tryParse(entered_Sqrt_input_ma.text) != null;
  }
}
