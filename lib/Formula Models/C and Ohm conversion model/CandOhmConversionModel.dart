class CandOhmConversionModel {
  late double current_calculated_Ohm_to_C = double.nan;
  late double current_calculated_C_to_Ohm = double.nan;

  double calculate_Ohm_to_C(
    double Valid_Ohm_value,
  ) {
    current_calculated_Ohm_to_C = (Valid_Ohm_value - 100) * (1 / 0.385);

    return current_calculated_Ohm_to_C;
  }

  double calculate_C_to_Ohm(double valid_temperature) {
    current_calculated_C_to_Ohm = valid_temperature * 0.385 + 100;
    return current_calculated_C_to_Ohm;
  }
}
