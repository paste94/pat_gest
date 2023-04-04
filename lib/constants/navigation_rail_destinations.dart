import 'package:flutter/material.dart';
import 'package:pat_gest/utils/my_navigation_rail_destination.dart';
import 'package:pat_gest/views/offices/offices_list_view.dart';
import 'package:pat_gest/views/options/options_view.dart';
import 'package:pat_gest/views/patients/patient_list_view.dart';
import 'package:pat_gest/views/visits/visits_view.dart';

import '../views/foods/foods_list_view.dart';

final destinations = <MyNavigationRailDestination>[
  MyNavigationRailDestination(
    icon: const Icon(Icons.person),
    label: const Text('Patients'),
    pageToLoad: const PatientListView(),
  ),
  MyNavigationRailDestination(
    icon: const Icon(Icons.computer),
    label: const Text('Offices'),
    pageToLoad: const OfficesListView(),
  ),
  MyNavigationRailDestination(
    icon: const Icon(Icons.food_bank),
    label: const Text('Foods'),
    pageToLoad: const FoodsListView(),
  ),
  MyNavigationRailDestination(
    icon: const Icon(Icons.calendar_month),
    label: const Text('Calendar'),
    pageToLoad: const VisitsView(),
  ),
  MyNavigationRailDestination(
    icon: const Icon(Icons.settings),
    label: const Text('Options'),
    pageToLoad: const OptionsView(),
  ),
];
