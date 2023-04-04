import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' show Color, Colors;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'foods.dart';
import 'offices.dart';
import 'patients.dart';
import 'visits.dart';

// https://drift.simonbinder.eu/docs/getting-started/
// flutter pub run build_runner build

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'drift_database.g.dart';

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Patients, Offices, Foods, Visits])
class PatGestDatabase extends _$PatGestDatabase {
  // we tell the database where to store the data with this constructor
  PatGestDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Stream<List<Patient>> watchPatientsList() {
    return (select(patients)).watch();
  }

  Future updatePatient({
    required int id,
    required PatientsCompanion newPatientsCompanion,
  }) async {
    return await (update(patients)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .write(newPatientsCompanion);
  }

  Future deletePatient({required int id}) async {
    return await (delete(patients)..where((t) => t.id.equals(id))).go();
  }

  Stream<Patient> watchPatient(int id) {
    return (select(patients)..where((tbl) => tbl.id.equals(id))).watchSingle();
  }

  Stream<List<Visit>> watchVisitsList(Patient? patient) {
    if (patient != null) {
      return (select(visits)..where((tbl) => tbl.patientId.equals(patient.id)))
          .watch();
    } else {
      return (select(visits)).watch();
    }
  }

  Stream<Visit> watchVisit(int id) {
    return (select(visits)..where((tbl) => tbl.id.equals(id))).watchSingle();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'PatGestData', 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
