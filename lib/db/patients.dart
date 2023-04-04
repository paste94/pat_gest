// ignore_for_file: recursive_getters

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
import 'package:drift/drift.dart';

class Patients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get surname => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get notes => text().nullable()();
  RealColumn get height => real().check(height.isBiggerOrEqualValue(0))();
  DateTimeColumn get dateOfBirth => dateTime()
      .check(dateOfBirth.isBiggerThan(Constant(DateTime(1900))))
      .nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
