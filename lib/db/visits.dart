// ignore_for_file: recursive_getters

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
import 'package:drift/drift.dart';
import 'package:flutter/material.dart' show Color, Colors;
import 'package:pat_gest/db/patients.dart';

class Visits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  TextColumn get eventName => text()();
  BoolColumn get isAllDay => boolean().withDefault(const Constant(false))();
  DateTimeColumn get from => dateTime()();
  DateTimeColumn get to => dateTime()();
  RealColumn get weight =>
      real().check(weight.isBiggerOrEqualValue(0)).nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get background => text()
      .map(const ColorConverter())
      .withDefault(Constant(Colors.blue.value.toString()))();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  BoolColumn get isCanceled => boolean().withDefault(const Constant(false))();
  BoolColumn get isInitial => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class ColorConverter extends TypeConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromSql(String fromDb) {
    return Color(int.parse(fromDb));
  }

  @override
  String toSql(Color value) {
    return value.value.toString();
  }
}
