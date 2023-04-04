import 'package:flutter/material.dart';
import 'package:pat_gest/constants/routes.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:pat_gest/services/crud_service.dart';

class PatientListView extends StatefulWidget {
  const PatientListView({super.key});

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patients List')),
      body: _listBuilder(context),
      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTag',
        onPressed: () {
          Navigator.of(context).pushNamed(addPatientRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _listBuilder(BuildContext context) => StreamBuilder(
      stream: CrudService().getPatientsListStream(),
      builder: (BuildContext context, AsyncSnapshot<List<Patient>> snapshot) {
        final patientsList = snapshot.data ?? [];
        if (patientsList.isEmpty) {
          return const Center(
            child: Text(
              'Nothing here, press "+" button to add your first patient!',
            ),
          );
        } else {
          return Center(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: patientsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      iconColor: Theme.of(context).primaryColor,
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          '${patientsList[index].name[0]}${patientsList[index].surname[0]}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                          '${patientsList[index].name} ${patientsList[index].surname}'),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          patientRoute,
                          arguments: patientsList[index].id,
                        );
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          );
        }
      });
}
