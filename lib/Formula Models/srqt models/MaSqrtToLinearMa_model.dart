import 'dart:math';

class MaSqrtToLinearMa_model {
  late double current_calculated_span_value = double.nan;
  late double current_calculated_Sqrt_Output_Perc_value = double.nan;
  late double current_calculated_SqrtPV_value = double.nan;
  late double current_calculated_Linear_MA_value = double.nan;
  late double current_calculated_Linear_Perc_value = double.nan;
  late double current_calculated_Linear_PV_value = double.nan;

  double calculate_span(double lrv, double urv) {
    //formula
    current_calculated_span_value = urv - lrv;
    return current_calculated_span_value;
  }

  double calculate_SqrtOutputPercentage(double valid_sqrtInputMA) {
    current_calculated_Sqrt_Output_Perc_value =
        ((valid_sqrtInputMA / 16) * 100) - 25;
    return current_calculated_Sqrt_Output_Perc_value;
  }

  double calculate_SqrtPv(
      double valid_sqrtOutputPercentage, double valid_span) {
    current_calculated_SqrtPV_value =
        (valid_sqrtOutputPercentage / 100) * valid_span;
    return current_calculated_SqrtPV_value;
  }

  double calculate_LinearMA(double valid_sqrtInputMA) {
    current_calculated_Linear_MA_value = 4 + (sqrt(valid_sqrtInputMA - 4) / 16);
    return current_calculated_Linear_MA_value;
  }

  double calculate_LinearPercentage(double valid_linearMa) {
    current_calculated_Linear_Perc_value = ((valid_linearMa / 16) * 100) - 25;
    return current_calculated_Linear_Perc_value;
  }

  double calculate_LinearPv(double valid_calculated_linear_perc,
      double valid_Span, double valid_LRV) {
    current_calculated_Linear_PV_value =
        valid_calculated_linear_perc * valid_Span / 100 + valid_LRV;
    return current_calculated_Linear_PV_value;
  }
}
