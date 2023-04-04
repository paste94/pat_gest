// ignore_for_file: recursive_getters

import 'package:drift/drift.dart';

class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  RealColumn get calories =>
      real().check(calories.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get protein =>
      real().check(protein.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get carbohydrates =>
      real().check(carbohydrates.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get dietaryFiber =>
      real().check(dietaryFiber.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get sugar =>
      real().check(sugar.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get fatTotal =>
      real().check(fatTotal.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get fatSatured =>
      real().check(fatSatured.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get fatMonounsaturated =>
      real().check(fatMonounsaturated.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get fatPolyunsaturated =>
      real().check(fatPolyunsaturated.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get water =>
      real().check(water.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get cholesterol =>
      real().check(cholesterol.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get sodium =>
      real().check(sodium.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminA =>
      real().check(vitaminA.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminB1 =>
      real().check(vitaminB1.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminB11 =>
      real().check(vitaminB11.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminB12 =>
      real().check(vitaminB12.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminB2 =>
      real().check(vitaminB2.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminB3 =>
      real().check(vitaminB3.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminB5 =>
      real().check(vitaminB5.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminB6 =>
      real().check(vitaminB6.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminC =>
      real().check(vitaminC.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminD =>
      real().check(vitaminD.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminE =>
      real().check(vitaminE.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get vitaminK =>
      real().check(vitaminK.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get calcium =>
      real().check(calcium.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get iron =>
      real().check(iron.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get phosphorus =>
      real().check(phosphorus.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get magnesium =>
      real().check(magnesium.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get manganese =>
      real().check(manganese.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get potassium =>
      real().check(potassium.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get copper =>
      real().check(copper.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get selenium =>
      real().check(selenium.isBiggerOrEqualValue(0)).nullable()();
  RealColumn get zinc =>
      real().check(zinc.isBiggerOrEqualValue(0)).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
