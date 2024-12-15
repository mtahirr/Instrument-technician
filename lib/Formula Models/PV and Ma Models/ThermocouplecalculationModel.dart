class thermocoupleCalculationModel {
  double current_calculated_tempKtype = double.nan;
  double current_calculated_tempJtype = double.nan;
  List<String> Filtration_Options = [
    "Select",
    "Temp (J-type)",
    "Temp (K-type)",
  ];

  double tempKtype(double validMvKtype, double validABtempKtype) {
    current_calculated_tempKtype = (25 * validMvKtype) + validABtempKtype;
    return current_calculated_tempKtype;
  }

  double tempJtype(double validMvJtype, double validABtempJtype) {
    current_calculated_tempJtype = (15 * validMvJtype) + validABtempJtype;
    return current_calculated_tempJtype;
  }
}
