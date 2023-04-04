import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pat_gest/constants/routes.dart';
import 'package:pat_gest/constants/strings.dart';
import 'package:pat_gest/constants/theme.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:pat_gest/services/crud_service.dart';
import 'package:pat_gest/utils/error_alert.dart';
import 'package:pat_gest/utils/pair.dart';
import 'package:pat_gest/utils/text_divider.dart';
import 'package:pat_gest/views/error/error_view.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _dateController = TextEditingController();
  final _notesController = TextEditingController();
  final _heightController = TextEditingController();
  bool _isEnabled = false;

  final _firstDayOfWeek = 1;
  final _calendarView = CalendarView.schedule;
  final _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    final int patientId = ModalRoute.of(context)!.settings.arguments as int;
    return StreamBuilder(
      stream: CrudService().getPatientStream(id: patientId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorView();
        }
        Patient? patient = snapshot.data;

        _nameController.text = patient?.name ?? '...';
        _surnameController.text = patient?.surname ?? '...';
        _emailController.text = patient?.email ?? '...';
        _phoneNumberController.text = patient?.phoneNumber ?? '...';
        _notesController.text = patient?.notes ?? '...';
        _heightController.text = '${patient?.height}';
        _dateController.text = DateFormat(dateFormatConst)
            .format(patient?.dateOfBirth ?? DateTime.now());

        return Scaffold(
          appBar: AppBar(
            title: Text('${patient?.name} ${patient?.surname}'),
            actions: [
              _isEnabled
                  ? IconButton(
                      onPressed: () => _handleEditPatient(
                        context: context,
                        patient: patient,
                      ),
                      icon: const Icon(Icons.save),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isEnabled = true;
                        });
                      },
                      icon: const Icon(Icons.edit),
                    ),
              PopupMenuButton<int>(
                onSelected: (item) => _handleDeletion(
                  context: context,
                  patient: patient,
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text('Delete user'),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                runSpacing: spacingConst,
                children: [
                  const TextDivider(text: 'Personal data'),
                  Row(
                    children: [
                      // Name
                      Expanded(
                        child: TextField(
                          enabled: _isEnabled,
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          style: _textColorStyle(context),
                        ),
                      ),
                      SizedBox(width: spacingConst),
                      // Surname
                      Expanded(
                        child: TextField(
                          enabled: _isEnabled,
                          controller: _surnameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Surname',
                          ),
                          style: _textColorStyle(context),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Email
                      Expanded(
                        child: TextField(
                          enabled: _isEnabled,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          style: _textColorStyle(context),
                        ),
                      ),
                      SizedBox(width: spacingConst),
                      // Phone number
                      Expanded(
                        child: TextField(
                          enabled: _isEnabled,
                          controller: _phoneNumberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone number',
                          ),
                          style: _textColorStyle(context),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Height
                      Expanded(
                        child: TextField(
                          enabled: _isEnabled,
                          controller: _heightController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Height',
                            suffix: Text('cm'),
                          ),
                          style: _textColorStyle(context),
                        ),
                      ),
                      SizedBox(width: spacingConst),
                      // Birth date
                      Expanded(
                        child: TextField(
                          enabled: _isEnabled,
                          controller: _dateController,
                          style: _textColorStyle(context),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Birth date',
                            suffixIcon: IconButton(
                              onPressed: () => _handleOpenDatePicker(
                                context: context,
                                initialDate: patient!.dateOfBirth!,
                              ),
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Notes
                  TextField(
                    enabled: _isEnabled,
                    controller: _notesController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Notes',
                    ),
                    style: _textColorStyle(context),
                  ),
                  const TextDivider(text: 'Visits'),
                  _visitsListBuilder(context, patient),
                  SizedBox(height: spacingConst * 30),
                  Container(margin: const EdgeInsets.all(20.0))
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'addVisitTag',
            onPressed: () {
              Navigator.of(context).pushNamed(
                addVisitRoute,
                arguments: Pair<Patient?, DateTime?>(patient, null),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _visitsListBuilder(
    BuildContext context,
    Patient? patient,
  ) =>
      StreamBuilder(
        stream: CrudService().getVisitsListStream(patient: patient),
        builder: (context, snapshot) {
          final visitsList = snapshot.data ?? [];
          if (visitsList.isEmpty) {
            return const Center(
              child: Text(
                'Nothing here, press "+" button to add your first visit!',
              ),
            );
          } else {
            return Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: visitsList.length,
                // padding: EdgeInsets.all(spacingConst),
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: visitsList[index].background,
                        child: Column(
                          children: [
                            Text(
                              '${visitsList[index].from.day}',
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              DateFormat('MMM').format(visitsList[index].from),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      title: Row(
                        children: [
                          // FROM TO
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'From  \nTo',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    '''${visitsList[index].from.hour.toString().padLeft(2, '0')}:${visitsList[index].from.minute.toString().padLeft(2, '0')}\n${visitsList[index].to.hour.toString().padLeft(2, '0')}:${visitsList[index].to.minute.toString().padLeft(2, '0')}''',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(width: spacingConst),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: spacingConst * 3),
                          // EVENT NAME
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(visitsList[index].eventName),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  visitsList[index].notes ?? '',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Text(
                        '${visitsList[index].isInitial ? 'First visit' : 'Control visit'}\n(${visitsList[index].to.difference(visitsList[index].from).inMinutes} min)',
                        style: const TextStyle(fontSize: 13),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            );
          }
        },
      );

  TextStyle? _textColorStyle(context) {
    return _isEnabled
        ? null
        : TextStyle(color: Theme.of(context).disabledColor);
  }

  Future _handleEditPatient({
    required BuildContext context,
    Patient? patient,
  }) async {
    if (patient != null) {
      setState(() {
        _isEnabled = false;
      });
      Patient newPatient = Patient(
        id: patient.id,
        name: _nameController.text,
        surname: _surnameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
        notes: _notesController.text,
        height: double.parse(_heightController.text),
        dateOfBirth: DateFormat(dateFormatConst).parse(_dateController.text),
      );
      if (patient != newPatient) {
        try {
          await CrudService().updatePatient(newPatient);
        } catch (e) {
          showErrorAlert(context, e.toString());
        }
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Patient updated succesfully'),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {},
            ),
          ),
        );
      }
    }
  }

  Future _handleDeletion({
    required BuildContext context,
    Patient? patient,
  }) async {
    if (patient != null) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Warning!'),
              content: Text(
                'Are you really sure you want to delete ${patient.name} ${patient.surname}? \nThis operation cannot be undone!',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    CrudService().deletePatient(patient.id);
                  },
                  child: const Text('Delete'),
                )
              ],
            )),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  Future _handleOpenDatePicker({
    required BuildContext context,
    required DateTime initialDate,
  }) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      _dateController.text = DateFormat(dateFormatConst).format(pickedDate);
    }
  }
}
