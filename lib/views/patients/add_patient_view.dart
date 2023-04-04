import 'package:flutter/material.dart';
import 'package:pat_gest/constants/strings.dart';
import 'package:pat_gest/constants/theme.dart';
import 'package:pat_gest/services/crud_service.dart';
import 'package:pat_gest/utils/validator.dart';
import 'package:pat_gest/utils/text_divider.dart';
import 'package:intl/intl.dart';

class AddPatientView extends StatefulWidget {
  const AddPatientView({super.key});

  @override
  State<AddPatientView> createState() => _AddPatientViewState();
}

class _AddPatientViewState extends State<AddPatientView> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _notesController = TextEditingController();
  final _heightController = TextEditingController();
  final _initialWeightController = TextEditingController();
  final _dateController = TextEditingController(
      text: DateFormat(dateFormatConst).format(DateTime.now()));
  var _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _notesController.dispose();
    _heightController.dispose();
    _initialWeightController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            runSpacing: spacingConst,
            children: [
              const TextDivider(text: 'Personal data'),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Name*',
                        errorText: _submitted
                            ? nameValidator(_nameController.text)
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(width: spacingConst),
                  Expanded(
                    child: TextField(
                      controller: _surnameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Surname*',
                        errorText: _submitted
                            ? surnameValidator(_surnameController.text)
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Email',
                        errorText: _submitted
                            ? emailValidator(_emailController.text)
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(width: spacingConst),
                  Expanded(
                    child: TextField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _heightController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Height*',
                        suffix: const Text('cm'),
                        errorText: _submitted
                            ? heightValidator(_heightController.text)
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(width: spacingConst),
                  Expanded(
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Birth date*',
                        errorText: _submitted
                            ? birthDateValidator(_dateController.text)
                            : null,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              _dateController.text = DateFormat(dateFormatConst)
                                  .format(pickedDate);
                            }
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TextDivider(text: 'Notes'),
              TextField(
                controller: _notesController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Notes',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'uniqueTag',
        onPressed: () async {
          setState(() => _submitted = true);
          var loadPatient = true;
          if (nameValidator(_nameController.text) != null ||
              surnameValidator(_surnameController.text) != null ||
              emailValidator(_emailController.text) != null ||
              birthDateValidator(_dateController.text) != null ||
              heightValidator(_heightController.text) != null) {
            loadPatient = false;
          }

          if (loadPatient) {
            // show LOADING dialog
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
            await CrudService().createPatient(
              name: _nameController.text,
              surname: _surnameController.text,
              dateOfBirth:
                  DateFormat(dateFormatConst).parse(_dateController.text),
              height: double.parse(_heightController.text),
              email: _emailController.text,
              phoneNumber: _phoneNumberController.text,
              notes: _notesController.text,
            );

            // close the dialog automatically
            if (mounted) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
          }
        },
        label: const Row(
          children: [Icon(Icons.add), Text('Add')],
        ),
      ),
    );
  }
}
