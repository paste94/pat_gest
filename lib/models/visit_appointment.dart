import 'package:flutter/material.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class VisitAppointment extends Appointment {
  final Visit visit;
  VisitAppointment({required this.visit})
      : super(
          startTime: visit.from,
          endTime: visit.to,
          subject: visit.eventName,
          // TODO: Rendilo impostabile dalle opzioni
          color: Colors.blue,
          startTimeZone: '',
          endTimeZone: '',
        );
}
