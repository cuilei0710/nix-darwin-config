{ ... }:

{
  system.defaults.NSGlobalDomain = {
    # Keep typed text unchanged by automatic substitutions and corrections.
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSAutomaticInlinePredictionEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = false;
  };

  # Automatic correction and continuous spell checking are separate settings.
  # Disable the latter in apps that honor this macOS preference.
  system.defaults.CustomUserPreferences."NSGlobalDomain".NSAllowContinuousSpellChecking = false;
}
