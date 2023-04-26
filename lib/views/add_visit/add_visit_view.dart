import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pat_gest/constants/strings.dart';
import 'package:pat_gest/constants/theme.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:pat_gest/services/crud_service.dart';
import 'package:pat_gest/utils/error_alert.dart';
import 'package:pat_gest/utils/text_divider.dart';
import 'package:pat_gest/utils/validator.dart';
import 'package:pat_gest/views/add_visit/visit_duration.dart';

class AddVisitView extends StatefulWidget {
  final Patient? patient;
  final DateTime? dateTime;
  const AddVisitView({super.key, this.patient, this.dateTime});

  @override
  State<AddVisitView> createState() => _AddVisitViewState();
}

class _AddVisitViewState extends State<AddVisitView> {
  Patient? _selectedPatient;
  bool _isInitial = false;
  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _notesController = TextEditingController();

  bool _isSubmitted = false;

  // This is the list of items shown in the dropdown
  final _visitDurationList = VisitDuration.values
      .map<DropdownMenuItem<VisitDuration>>(
        (VisitDuration value) => DropdownMenuItem<VisitDuration>(
          value: value,
          child: Text(value.displayTitle),
        ),
      )
      .toList();

  // This is the selected item in the dropdown
  VisitDuration? _selectedEndTimeSelection = VisitDuration.oneHour;

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startTimeController.addListener(_updateEndTime);
    _dateController.text =
        DateFormat(dateFormatConst).format(widget.dateTime ?? DateTime.now());
    _startTimeController.text = widget.dateTime == null
        ? '00:00'
        : '${widget.dateTime?.hour.toString().padLeft(2, '0')}:${widget.dateTime?.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // This variable enables the timepicker
    bool isEndTimePickerEnabled = _selectedEndTimeSelection != null
        ? _selectedEndTimeSelection == VisitDuration.custom
        : true;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Visit')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(spacingConst),
          child: Wrap(
            runSpacing: spacingConst,
            children: [
              const TextDivider(text: 'Visit details'),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    // Select patient
                    child: FutureBuilder(
                      future: CrudService().getPatientsList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          showErrorAlert(
                            context,
                            'Error while loading patients!',
                          );
                        }

                        // Dropdown is enabled only if patient is null
                        bool isDropdownEnabled = widget.patient == null;

                        // The patient list contains only the patient passed as parameter if
                        // it is not null, otherwise it contains all data from database
                        List<Patient>? patientsList = widget.patient != null
                            ? [widget.patient!]
                            : snapshot.data;

                        _selectedPatient = patientsList?.first;

                        var dropdownMenuItems = patientsList
                            ?.map((Patient patient) => DropdownMenuItem(
                                  value: patient,
                                  child: Text(
                                      '${patient.name} ${patient.surname}'),
                                ))
                            .toList();

                        return DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabled: isDropdownEnabled,
                            border: const OutlineInputBorder(),
                            labelText: 'Select patient',
                            errorText: _isSubmitted
                                ? (_selectedPatient == null
                                    ? 'Patient must be selected'
                                    : null)
                                : null,
                          ),
                          items: dropdownMenuItems,
                          value: _selectedPatient,
                          onChanged: isDropdownEnabled
                              ? (Patient? item) =>
                                  setState(() => _selectedPatient = item)
                              : null,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: spacingConst),
                  Expanded(
                    // First Visit
                    child: CheckboxListTile(
                      title: const Text('First visit'),
                      value: _isInitial,
                      onChanged: (bool? newValue) =>
                          setState(() => _isInitial = newValue ?? false),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    // Select date
                    child: TextField(
                      controller: _dateController,
                      enabled: widget.dateTime == null,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Select date',
                        errorText: _isSubmitted
                            ? dateValidator(_dateController.text)
                            : null,
                        suffixIcon: IconButton(
                          onPressed: () => _openDateTimePicker(widget.dateTime),
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: spacingConst),
                  Expanded(
                    // Start visit
                    child: TextField(
                      controller: _startTimeController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Start visit',
                        errorText: _isSubmitted
                            ? timeValidator(_startTimeController.text)
                            : null,
                        suffixIcon: IconButton(
                          onPressed: _openStartTimePicker,
                          icon: const Icon(Icons.access_time),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: spacingConst),
                  Expanded(
                    // Select Timing
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Select timing',
                      ),
                      items: _visitDurationList,
                      value: _selectedEndTimeSelection,
                      onChanged: (item) {
                        setState(() {
                          _selectedEndTimeSelection = item;
                        });
                        _updateEndTime();
                      },
                    ),
                  ),
                  SizedBox(width: spacingConst),
                  Expanded(
                    // End Visit
                    child: TextField(
                      controller: _endTimeController,
                      enabled: isEndTimePickerEnabled,
                      style: isEndTimePickerEnabled
                          ? null
                          : TextStyle(color: Theme.of(context).disabledColor),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'End visit',
                        errorText: _isSubmitted
                            ? timeValidator(_endTimeController.text)
                            : null,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: int.parse(
                                    _endTimeController.text.split(':')[0]),
                                minute: int.parse(
                                    _endTimeController.text.split(':')[1]),
                              ),
                            );
                            if (pickedTime != null && mounted) {
                              _endTimeController.text =
                                  pickedTime.format(context);
                            }
                          },
                          icon: const Icon(Icons.access_time),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TextDivider(text: 'Notes'),
              Row(
                children: [
                  Expanded(
                    // Notes
                    child: TextField(
                      controller: _notesController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 3,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Notes',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addVisitTag',
        onPressed: _loadPatient,
        label: const Row(
          children: [Icon(Icons.add), Text('Add')],
        ),
      ),
    );
  }

  void _loadPatient() async {
    setState(() => _isSubmitted = true);
    bool loadVisit = false;
    print('_dateController, ${dateValidator(_dateController.text)}');
    print('_endTimeController, ${timeValidator(_endTimeController.text)}');
    print('_startTimeController, ${timeValidator(_startTimeController.text)}');
    print('_selectedPatient, ${_selectedPatient}');
    if (dateValidator(_dateController.text) == null &&
        timeValidator(_endTimeController.text) == null &&
        timeValidator(_startTimeController.text) == null &&
        _selectedPatient != null) {
      loadVisit = true;
    }

    if (loadVisit) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) {
            return const Dialog(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Loading...')
                  ],
                ),
              ),
            );
          });

      // Load data to database
      await CrudService().createVisit(
        patient: _selectedPatient!,
        from: DateFormat('dd/MM/yyyy HH:mm')
            .parse('${_dateController.text} ${_startTimeController.text}'),
        to: DateFormat('dd/MM/yyyy HH:mm')
            .parse('${_dateController.text} ${_endTimeController.text}'),
        eventName: '${_selectedPatient!.name} ${_selectedPatient!.surname}',
        isInitial: _isInitial,
        notes: _notesController.text,
      );

      // close the dialog automatically
      if (mounted) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    }
  }

  void _openDateTimePicker(DateTime? initialDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
    );
    if (pickedDate != null) {
      _dateController.text = DateFormat(dateFormatConst).format(pickedDate);
    }
  }

  void _openStartTimePicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _setInitialTime(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (pickedTime != null && mounted) {
      _startTimeController.text = pickedTime.format(context);
    }
  }

  /// This function is used to setup the initial time. If the initial time
  /// is not parsable it returns a default value
  TimeOfDay _setInitialTime() {
    try {
      return TimeOfDay(
        hour: int.parse(_startTimeController.text.split(':')[0]),
        minute: int.parse(_startTimeController.text.split(':')[1]),
      );
    } on FormatException {
      return const TimeOfDay(hour: 0, minute: 0);
    }
  }

  /// This function is used to update the end time when the start time is changed and
  /// the dropdown selection is oneHour or halfAnHour
  void _updateEndTime() {
    try {
      if (_selectedEndTimeSelection == VisitDuration.oneHour) {
        _endTimeController.text = TimeOfDay(
          hour: int.parse(_startTimeController.text.split(':')[0]) + 1,
          minute: int.parse(_startTimeController.text.split(':')[1]),
        ).format(context);
      } else if (_selectedEndTimeSelection == VisitDuration.halfAnHour) {
        var h = int.parse(_startTimeController.text.split(':')[0]);
        var m = int.parse(_startTimeController.text.split(':')[1]) + 30;
        if (m > 59) {
          h = h + 1;
          m = m - 60;
        }
        _endTimeController.text = TimeOfDay(
          hour: h,
          minute: m,
        ).format(context);
      }
    } catch (e) {
      _endTimeController.text = '--:--';
    }
  }
}
