class PvToMaModel {
  late double current_calculated_span_value = double.nan;
  late double current_calculated_MaToPv_value = double.nan;
  late double current_calculated_PvToMa_value = double.nan;
  late double current_calculated_PvToPercentage_value = double.nan;
  late double current_calculated_PercentageToPv_value = double.nan;
  late double current_calculated_PercentageToMa_value = double.nan;
  late double current_calculated_MaToPercentage_value = double.nan;

  double calculate_span(double lrv, double urv) {
    //formula
    current_calculated_span_value = urv - lrv;
    return current_calculated_span_value;
  }

  double calculate_MaToPv(double ValidSpan, double validMA, double validLRV) {
    //formula
    current_calculated_MaToPv_value =
        ((ValidSpan / 16) * (validMA - 4) + validLRV);
    return current_calculated_MaToPv_value;
  }

  double calculate_PvToMa(double ValidSpan, double validPV, double validLRV) {
    //formula
    current_calculated_PvToMa_value =
        ((16 / ValidSpan) * (validPV - validLRV) + 4);
    return current_calculated_PvToMa_value;
  }

  double calculate_PvToPercentage(
      double ValidSpan, double validPV, double validLRV) {
    //formula
    current_calculated_PvToPercentage_value =
        (((validPV - validLRV) / ValidSpan) * 100);
    return current_calculated_PvToPercentage_value;
  }

  double calculate_PercentageToPv(
      double ValidSpan, double validPercentage, double validLRV) {
    //formula
    current_calculated_PercentageToPv_value =
        (((validPercentage * ValidSpan) / 100) + validLRV);
    return current_calculated_PercentageToPv_value;
  }

  double calculate_MaToPercentage(
    double validMa,
  ) {
    //formula
    current_calculated_MaToPercentage_value = (((validMa) / 16) * 100) - 25;
    return current_calculated_MaToPercentage_value;
  }

  double calculate_PercentageToMa(
    double validPercentage,
  ) {
    //formula
    current_calculated_PercentageToMa_value =
        (((validPercentage) / 100) * 16) + 4;
    return current_calculated_PercentageToMa_value;
  }
}
