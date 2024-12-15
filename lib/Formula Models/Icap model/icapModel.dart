class icapModel {
  late double current_calculated_span_value = double.nan;
  late double current_calculated_Standard_PV_value = double.nan;
  late double current_calculated_Ma_Deviation_value = double.nan;
  late double current_calculated_Ma_Error_in_Perce_value = double.nan;
  late double current_calculated_PV_Deviation_value = double.nan;
  late double current_calculated_PV_Error_in_Perce_value = double.nan;

  List<String> standard_Data_Column_headings_List = [
    "Standard PV",
    "Standard PV Unit",
    "Standard Output Perc",
    "Standard Ma",
    "Ma As found",
    "PV As found",
    "Ma As Left",
    "PV As Left",
    "Deviation PV",
    "PV Error %",
    "MA Error %",
    "Deviation MA",
  ];

  bool allValuesSet() {
    return ![
      current_calculated_span_value,
      current_calculated_Standard_PV_value,
      current_calculated_Ma_Deviation_value,
      current_calculated_Ma_Error_in_Perce_value,
      current_calculated_PV_Deviation_value,
      current_calculated_PV_Error_in_Perce_value,
    ].any((value) => value.isNaN);
  }

  late List<double> Standard_output_Perc_List = [0, 25, 50, 75, 100];
  late List<double> Standard_Ma_List = [4, 8, 12, 16, 20];

  double calculate_span(double lrv, double urv) {
    //formula
    current_calculated_span_value = urv - lrv;
    return current_calculated_span_value;
  }

  double calculate_standardPV(double valid_standard_output_Percentage,
      double valid_span, double valid_LRV) {
    //formula
    current_calculated_Standard_PV_value =
        ((valid_standard_output_Percentage * valid_span) / 100) + valid_LRV;
    return current_calculated_Standard_PV_value;
  }

  double calculate_Ma_Deviation(
    double valid_Ma_AsLeft,
    double valid_standard_ma,
  ) {
    //formula
    current_calculated_Ma_Deviation_value = valid_Ma_AsLeft - valid_standard_ma;
    return current_calculated_Ma_Deviation_value;
  }

  double calculate_Ma_In_Error_Percentage(
    double valid_Ma_Deviation,
  ) {
    //formula
    current_calculated_Ma_Error_in_Perce_value =
        (valid_Ma_Deviation / 16) * 100;
    return current_calculated_Ma_Error_in_Perce_value;
  }

  double calculate_PV_Deviation(
    double valid_PV_AsLeft,
    double valid_standard_PV,
  ) {
    //formula
    current_calculated_PV_Deviation_value = valid_PV_AsLeft - valid_standard_PV;
    return current_calculated_PV_Deviation_value;
  }

  double calculate_Pv_In_Error_Percentage(
      double valid_PV_Deviation, double valid_Span) {
    //formula
    current_calculated_PV_Error_in_Perce_value =
        ((valid_PV_Deviation) / valid_Span) * 100;
    return current_calculated_PV_Error_in_Perce_value;
  }
}
