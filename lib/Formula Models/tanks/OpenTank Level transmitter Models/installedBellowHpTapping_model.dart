class installedBellowHpTapping_model {
  double Current_Calculated_lrv = double.nan;
  double Current_Calculated_Urv = double.nan;

  double calculate_urv(
      double valid_SGhead2, double valid_head2, double valid_lrv) {
    Current_Calculated_Urv = (valid_SGhead2 * valid_head2) + valid_lrv;
    return Current_Calculated_Urv;
  }

  double calculate_lrv(double sgHead1, double head1) {
    Current_Calculated_lrv = sgHead1 * head1;
    return Current_Calculated_lrv;
  }
}
