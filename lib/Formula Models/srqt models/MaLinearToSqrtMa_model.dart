import 'dart:math';

class MaLinearToSqrtMa_model {
  late double current_calculated_span_value = double.nan;
  late double current_calculated_linear_Output_Perc_value = double.nan;
  late double current_calculated_Linear_PV_value = double.nan;
  late double current_calculated_Sqrt_Output_MA_value = double.nan;
  late double current_calculated_Sqrt_Output_Perc_value = double.nan;
  late double current_calculated_sqrt_pv_value = double.nan;

  double calculate_span(double lrv, double urv) {
    //formula
    current_calculated_span_value = urv - lrv;
    return current_calculated_span_value;
  }

  double calculate_linearOutputPercentage(double valid_linear_input_ma) {
    current_calculated_linear_Output_Perc_value =
        ((valid_linear_input_ma / 16) * 100) - 25;
    return current_calculated_linear_Output_Perc_value;
  }

  double calculate_linearPv(
      double valid_linear_output_perc, double valid_span) {
    current_calculated_Linear_PV_value =
        ((valid_linear_output_perc / 100) * valid_span);
    return current_calculated_Linear_PV_value;
  }

  double calculate_sqrtOutputMA(double valid_linear_input_ma) {
    current_calculated_Sqrt_Output_MA_value =
        4 + (4 * sqrt(valid_linear_input_ma - 4));
    return current_calculated_Sqrt_Output_MA_value;
  }

  double calculate_srqtOutputPerc(
    double valid_linear_output_perc,
  ) {
    current_calculated_Sqrt_Output_Perc_value =
        (sqrt(valid_linear_output_perc) / 10) * 100;
    return current_calculated_Sqrt_Output_Perc_value;
  }

  double calculate_sqrtPv(
      double valid_sqrtOutputPerc, double valid_span, double valid_LRV) {
    current_calculated_sqrt_pv_value =
        ((valid_sqrtOutputPerc * valid_span) / 100) + valid_LRV;
    return current_calculated_sqrt_pv_value;
  }
}
