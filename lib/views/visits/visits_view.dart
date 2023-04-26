import 'package:flutter/material.dart';
import 'package:pat_gest/constants/routes.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:pat_gest/services/crud_service.dart';
import 'package:pat_gest/utils/pair.dart';
import 'package:pat_gest/views/visits/visits_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class VisitsView extends StatefulWidget {
  const VisitsView({super.key});

  @override
  State<VisitsView> createState() => _VisitsViewState();
}

class _VisitsViewState extends State<VisitsView> {
  //TODO: Cambia questo con un default selezionabile dalle opzioni
  final _calendarView = CalendarView.month;
  final _firstDayOfWeek = 1;
  final _calendarController = CalendarController();
  VisitsDataSource? _events = VisitsDataSource(<Visit>[]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visit Calendar'),
        leading: _calendarController.view == CalendarView.day
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() {
                  _calendarController.view = CalendarView.month;
                }),
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                ),
                enableFeedback: false,
                onPressed: null,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'addVisitTag',
        onPressed: () {
          _pushNamed(
            _calendarController.view == CalendarView.day
                ? DateTime(
                    _calendarController.selectedDate!.year,
                    _calendarController.selectedDate!.month,
                    _calendarController.selectedDate!.day,
                  )
                : null,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Visit>>(
          stream: CrudService().getVisitsListStream(),
          builder: (BuildContext context, AsyncSnapshot<List<Visit>> snapshot) {
            List<Visit>? visitsList = snapshot.data;
            return SfCalendar(
              firstDayOfWeek: _firstDayOfWeek,
              showNavigationArrow: true,
              view: _calendarView,
              controller: _calendarController,
              showDatePickerButton: true,
              allowViewNavigation: true,
              onLongPress:
                  (CalendarLongPressDetails calendarLongPressDetails) {},
              onTap: (CalendarTapDetails calendarTapDetails) async {
                print('${calendarTapDetails.date}');
                if (calendarTapDetails.date?.hour != 0) {
                  _pushNamed(calendarTapDetails.date);
                }
                setState(() {});
              },
              dataSource: VisitsDataSource(visitsList),
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
            );
          }),
    );
  }

  void _pushNamed(DateTime? dateTime) {
    Navigator.of(context).pushNamed(
      addVisitRoute,
      arguments: Pair<Patient?, DateTime?>(null, dateTime),
    );
  }

  VisitsDataSource _getCalendarDataSource() {
    List<Visit> appointments = <Visit>[];
    appointments.add(Visit(
      id: 1,
      eventName: 'CIAOOOO',
      patientId: 1,
      isAllDay: false,
      from: DateTime.now(),
      to: DateTime.now().add(
        const Duration(hours: 2),
      ),
      background: Colors.blue,
      isCanceled: false,
      isDone: false,
      isInitial: false,
    ));

    return VisitsDataSource(appointments);
  }
}
