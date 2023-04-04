import 'package:drift/drift.dart';
import 'package:pat_gest/db/drift_database.dart';
import 'package:pat_gest/services/crud_exceptions.dart';

class CrudService {
  static final CrudService _instance = CrudService._internal();

  PatGestDatabase? _db;

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory CrudService() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  CrudService._internal();

  PatGestDatabase _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseOpeningError();
    }
    return db;
  }

  Stream<List<Patient>> getPatientsListStream() {
    final db = _getDatabaseOrThrow();
    return db.watchPatientsList();
  }

  Stream<List<Visit>> getVisitsListStream({Patient? patient}) {
    final db = _getDatabaseOrThrow();
    return db.watchVisitsList(patient);
  }

  Future<List<Patient>> getPatientsList() async {
    final db = _getDatabaseOrThrow();
    return await db.watchPatientsList().first;
  }

  Stream<Patient> getPatientStream({required int id}) {
    final db = _getDatabaseOrThrow();
    Stream<Patient> stream = db.watchPatient(id);
    return stream;
  }

  Future<void> open() async {
    _db ??= PatGestDatabase();
  }

  /// This method lets you create a new patient on the database
  Future<int> createPatient({
    required String name,
    required String surname,
    required DateTime dateOfBirth,
    required double height,
    String? email,
    String? phoneNumber,
    String? notes,
  }) async {
    final db = _getDatabaseOrThrow();
    return await db.into(db.patients).insert(
          PatientsCompanion(
            name: Value(name),
            surname: Value(surname),
            dateOfBirth: Value(dateOfBirth),
            height: Value(height),
            email: Value(email),
            phoneNumber: Value(phoneNumber),
            notes: Value(notes),
          ),
        );
  }

  /// This method us ised to update a patient. The [newPatient] is an
  /// instance of [Patient] with the same [id] field of the previous
  /// patient but with some updated field.
  Future<void> updatePatient(Patient newPatient) async {
    final db = _getDatabaseOrThrow();
    return await db.updatePatient(
      id: newPatient.id,
      newPatientsCompanion: PatientsCompanion(
        id: Value(newPatient.id),
        name: Value(newPatient.name),
        surname: Value(newPatient.surname),
        dateOfBirth: Value(newPatient.dateOfBirth),
        height: Value(newPatient.height),
        email: Value(newPatient.email),
        phoneNumber: Value(newPatient.phoneNumber),
        notes: Value(newPatient.notes),
      ),
    );
  }

  Future<void> deletePatient(int id) async {
    final db = _getDatabaseOrThrow();
    return await db.deletePatient(id: id);
  }

  Future<int> createVisit({
    required Patient patient,
    required DateTime from,
    required DateTime to,
    String? notes,
    String? eventName,
    bool? isInitial,
  }) async {
    final db = _getDatabaseOrThrow();
    return await db.into(db.visits).insert(
          VisitsCompanion(
            patientId: Value(patient.id),
            eventName: Value.ofNullable(eventName),
            isAllDay: const Value(false),
            from: Value(from),
            to: Value(to),
            notes: Value.ofNullable(notes),
            isInitial: Value.ofNullable(isInitial),
          ),
        );
  }
}
