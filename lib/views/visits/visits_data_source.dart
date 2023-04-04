import 'package:flutter/material.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class VisitsDataSource extends CalendarDataSource {
  VisitsDataSource(List<Visit>? source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  Visit convertAppointmentToObject(
      Object? customData, Appointment appointment) {
    Visit visit = customData as Visit;
    return Visit(
      id: visit.id,
      eventName: 'CIOAO',
      patientId: visit.patientId,
      from: appointment.startTime,
      to: appointment.endTime,
      isAllDay: false,
      background: Colors.blue,
      isCanceled: false,
      isDone: false,
      isInitial: false,
    );
  }
}
