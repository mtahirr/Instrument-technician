class errorPercentage {
  late double current_LRV;
  late double current_urv;

  // calculation local storage
  late double current_calculated_span_value = double.nan;
  late double current_calculate_value_Pv_Span_Acceptable = double.nan;
  late double current_calculate_value_Ma_span_Acceptable = double.nan;
  late double current_calculated_standard_pv_value = double.nan;
  late double current_calculate_standard_Ma_value = double.nan;
  late double current_calculate_Pv_Eroor_perc = double.nan;
  late double current_calculate_Ma_Eroor_perc = double.nan;
  late double current_calculate_deviation_MA = double.nan;
  late double current_calculate_deviation_PV = double.nan;
  List<double> standardErrorValuePercentage_List = [0, 25, 50, 75, 100];
  List<String> standard_Data_Column_headings_List = [
    "Standard %",
    "Standard PV",
    "Standard MA",
    "Actual Pv",
    "Actual Ma",
    "Deviation PV",
    "Deviation MA",
    "PV Error %",
    'MA Error %',
  ];

  double calculate_span(double lrv, double urv) {
    //formula
    current_calculated_span_value = urv - lrv;
    return current_calculated_span_value;
  }

  double calculate_Pv_Span_Acceptable(
      double valid_acceptable_error_input, double valid_span) {
    //formula
    current_calculate_value_Pv_Span_Acceptable =
        ((valid_acceptable_error_input / 100) * valid_span);
    return current_calculate_value_Pv_Span_Acceptable;
  }

  calculate_Ma_span_Acceptable(
    double valid_acceptable_error_input,
  ) {
    //formula
    current_calculate_value_Ma_span_Acceptable =
        (valid_acceptable_error_input / 100) * 16;
    return current_calculate_value_Ma_span_Acceptable;
  }

  calculate_Standard_Pv(double valid_error_percentage, double valid_span_value,
      double valid_LRV) {
    print(
        "value in model, valid_LRV : $valid_LRV, valid_error_percentage : $valid_error_percentage, valid_span_value : $valid_span_value");

    double errorPercentageFraction = valid_error_percentage / 100;
    print("errorPercentageFraction : $errorPercentageFraction");
    double errorAdjustedSpanValue = errorPercentageFraction * valid_span_value;
    print("errorAdjustedSpanValue : $errorAdjustedSpanValue");
    double current_calculated_standard_pv_value =
        errorAdjustedSpanValue + valid_LRV;
    print("Standard PV results : $current_calculated_standard_pv_value");
    // current_calculated_standard_pv_value =
    //     (((valid_error_percentage / 100) * valid_span_value) + valid_LRV);
    return current_calculated_standard_pv_value;
  }

  double calculate_Standard_Ma(double valid_error_percentage) {
    //formula
    current_calculate_standard_Ma_value =
        ((valid_error_percentage / 100) * 16) + 4;
    return current_calculate_standard_Ma_value;
  }

  double calculate_Pv_Error_Percentage(
      double valid_actual_pv, double valid_standard_pv, double span) {
    current_calculate_Pv_Eroor_perc =
        (((valid_actual_pv - valid_standard_pv) / span) * 100);
    return current_calculate_Pv_Eroor_perc;
  }

  double calculate_Ma_Error_Percentage(
      double valid_actual_Ma, double valid_standard_Ma) {
    current_calculate_Ma_Eroor_perc =
        ((valid_actual_Ma - valid_standard_Ma) / 16) * 100;
    return current_calculate_Ma_Eroor_perc;
  }

  double calculate_Deviation_Pv(
      double valid_actual_pv, double valid_standard_Pv) {
    current_calculate_deviation_PV = valid_actual_pv - valid_standard_Pv;
    return current_calculate_deviation_PV;
  }

  calculate_Deviation_Ma(double valid_actual_MA, double valid_standard_MA) {
    current_calculate_deviation_MA = valid_actual_MA - valid_standard_MA;
    return current_calculate_deviation_MA;
  }
}
