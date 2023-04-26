// This is the list of items in the dropdown
enum VisitDuration {
  oneHour,
  halfAnHour,
  custom,
}

// This is the extension that creates the string shown in the dropdown
extension VisitDurationExtension on VisitDuration {
  String get displayTitle {
    switch (this) {
      case VisitDuration.oneHour:
        return 'One Hour';
      case VisitDuration.halfAnHour:
        return 'Half an hour';
      case VisitDuration.custom:
        return 'Custom';
    }
  }
}
