class betaRatioModel {
  late double current_calculated_beta_ratio_value = double.nan;
  late double current_calculated_Pipe_internal_dia_value = double.nan;

  double calculatebetaRatio(double Valid_Internal_Dia_Orfice_Plate_value,
      double valid_internal_dia_of_pipe_value) {
    current_calculated_beta_ratio_value =
        Valid_Internal_Dia_Orfice_Plate_value /
            valid_internal_dia_of_pipe_value;
    return current_calculated_beta_ratio_value;
  }

  double calculatePipeInternalDia(
      double valid_internal_dia_of_pipe_value, double valid_beta_ration_value) {
    current_calculated_Pipe_internal_dia_value =
        valid_internal_dia_of_pipe_value / valid_beta_ration_value;
    return current_calculated_Pipe_internal_dia_value;
  }
}
