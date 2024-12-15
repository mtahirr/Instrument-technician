class closedInstalledBellowHpTapping_model {
  double Current_Calculated_lrv = double.nan;
  double Current_Calculated_Urv = double.nan;

  double calculate_urv(double Sgtank, double SgWetLeg, double head1,
      double head2, double head3) {
    Current_Calculated_Urv =
        (Sgtank * head2) + (Sgtank * head3) - (SgWetLeg * head1);
    return Current_Calculated_Urv;
  }

  double calculate_lrv(
      double sgtank, double sgWetLeg, double head1, double head2) {
    Current_Calculated_lrv = (sgtank * head2) - (sgWetLeg * head1);
    return Current_Calculated_lrv;
  }
}
