import 'package:flutter/material.dart';
import 'package:pat_gest/constants/navigation_rail_destinations.dart';
import 'package:pat_gest/constants/routes.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:pat_gest/services/crud_service.dart';
import 'package:pat_gest/utils/pair.dart';
import 'package:pat_gest/views/add_visit/add_visit_view.dart';
import 'package:pat_gest/views/patients/add_patient_view.dart';
import 'package:pat_gest/views/patients/patient_view.dart';
import 'package:pat_gest/views/splash_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Pat Gest',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      addPatientRoute: (context) => const AddPatientView(),
      patientRoute: (context) => const PatientView(),
    },
    onGenerateRoute: (RouteSettings settings) {
      if (settings.name == addVisitRoute) {
        final args = settings.arguments as Pair<Patient?, DateTime?>?;
        return MaterialPageRoute(
          builder: ((context) => AddVisitView(
                patient: args?.first,
                dateTime: args?.second,
              )),
        );
      }
      return null;
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget _selectedPage = destinations[0].pageToLoad;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CrudService().open(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Row(
              children: <Widget>[
                NavigationRail(
                  groupAlignment: -1,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                      _selectedPage = destinations[index].pageToLoad;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: destinations,
                  selectedIndex: _selectedIndex,
                ),
                Expanded(
                  child: _selectedPage,
                )
              ],
            ),
          );
        } else {
          return const SplashView();
        }
      },
    );
  }
}
