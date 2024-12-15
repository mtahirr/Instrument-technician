class MaErrorAndDeviationModel {
  late double current_calculated_deviation = double.nan;
  late double current_calculated_Error_perc = double.nan;

  double calculate_Deviation(double MaAsFound, double StandardMA) {
    //formula
    current_calculated_deviation = MaAsFound - StandardMA;
    return current_calculated_deviation;
  }

  double calculate_errorPercentage(double MaAsFound, double StandardMA) {
    //formula
    current_calculated_Error_perc = ((MaAsFound - StandardMA) / 16) * 100;
    return current_calculated_Error_perc;
  }
}
