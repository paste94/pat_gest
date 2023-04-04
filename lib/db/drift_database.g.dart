// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _surnameMeta =
      const VerificationMeta('surname');
  @override
  late final GeneratedColumn<String> surname = GeneratedColumn<String>(
      'surname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, false,
      check: () => height.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'date_of_birth', aliasedName, true,
      check: () => dateOfBirth.isBiggerThan(Constant(DateTime(1900))),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, surname, email, phoneNumber, notes, height, dateOfBirth];
  @override
  String get aliasedName => _alias ?? 'patients';
  @override
  String get actualTableName => 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<Patient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('surname')) {
      context.handle(_surnameMeta,
          surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta));
    } else if (isInserting) {
      context.missing(_surnameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      surname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surname'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height'])!,
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_of_birth']),
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final int id;
  final String name;
  final String surname;
  final String? email;
  final String? phoneNumber;
  final String? notes;
  final double height;
  final DateTime? dateOfBirth;
  const Patient(
      {required this.id,
      required this.name,
      required this.surname,
      this.email,
      this.phoneNumber,
      this.notes,
      required this.height,
      this.dateOfBirth});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['surname'] = Variable<String>(surname);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['height'] = Variable<double>(height);
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      name: Value(name),
      surname: Value(surname),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      height: Value(height),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
    );
  }

  factory Patient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      surname: serializer.fromJson<String>(json['surname']),
      email: serializer.fromJson<String?>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      height: serializer.fromJson<double>(json['height']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'surname': serializer.toJson<String>(surname),
      'email': serializer.toJson<String?>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'notes': serializer.toJson<String?>(notes),
      'height': serializer.toJson<double>(height),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
    };
  }

  Patient copyWith(
          {int? id,
          String? name,
          String? surname,
          Value<String?> email = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          double? height,
          Value<DateTime?> dateOfBirth = const Value.absent()}) =>
      Patient(
        id: id ?? this.id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        email: email.present ? email.value : this.email,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        notes: notes.present ? notes.value : this.notes,
        height: height ?? this.height,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
      );
  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('notes: $notes, ')
          ..write('height: $height, ')
          ..write('dateOfBirth: $dateOfBirth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, surname, email, phoneNumber, notes, height, dateOfBirth);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.name == this.name &&
          other.surname == this.surname &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.notes == this.notes &&
          other.height == this.height &&
          other.dateOfBirth == this.dateOfBirth);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> surname;
  final Value<String?> email;
  final Value<String?> phoneNumber;
  final Value<String?> notes;
  final Value<double> height;
  final Value<DateTime?> dateOfBirth;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.height = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String surname,
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.notes = const Value.absent(),
    required double height,
    this.dateOfBirth = const Value.absent(),
  })  : name = Value(name),
        surname = Value(surname),
        height = Value(height);
  static Insertable<Patient> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? surname,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? notes,
    Expression<double>? height,
    Expression<DateTime>? dateOfBirth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (notes != null) 'notes': notes,
      if (height != null) 'height': height,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
    });
  }

  PatientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? surname,
      Value<String?>? email,
      Value<String?>? phoneNumber,
      Value<String?>? notes,
      Value<double>? height,
      Value<DateTime?>? dateOfBirth}) {
    return PatientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      notes: notes ?? this.notes,
      height: height ?? this.height,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('notes: $notes, ')
          ..write('height: $height, ')
          ..write('dateOfBirth: $dateOfBirth')
          ..write(')'))
        .toString();
  }
}

class $OfficesTable extends Offices with TableInfo<$OfficesTable, Office> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfficesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, phoneNumber, email, address];
  @override
  String get aliasedName => _alias ?? 'offices';
  @override
  String get actualTableName => 'offices';
  @override
  VerificationContext validateIntegrity(Insertable<Office> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Office map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Office(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
    );
  }

  @override
  $OfficesTable createAlias(String alias) {
    return $OfficesTable(attachedDatabase, alias);
  }
}

class Office extends DataClass implements Insertable<Office> {
  final int id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? address;
  const Office(
      {required this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.address});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    return map;
  }

  OfficesCompanion toCompanion(bool nullToAbsent) {
    return OfficesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
    );
  }

  factory Office.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Office(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
    };
  }

  Office copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> address = const Value.absent()}) =>
      Office(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        email: email.present ? email.value : this.email,
        address: address.present ? address.value : this.address,
      );
  @override
  String toString() {
    return (StringBuffer('Office(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phoneNumber, email, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Office &&
          other.id == this.id &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber &&
          other.email == this.email &&
          other.address == this.address);
}

class OfficesCompanion extends UpdateCompanion<Office> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> phoneNumber;
  final Value<String?> email;
  final Value<String?> address;
  const OfficesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
  });
  OfficesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
  });
  static Insertable<Office> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? email,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
    });
  }

  OfficesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? phoneNumber,
      Value<String?>? email,
      Value<String?>? address}) {
    return OfficesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfficesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
      'calories', aliasedName, true,
      check: () => calories.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _proteinMeta =
      const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
      'protein', aliasedName, true,
      check: () => protein.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _carbohydratesMeta =
      const VerificationMeta('carbohydrates');
  @override
  late final GeneratedColumn<double> carbohydrates = GeneratedColumn<double>(
      'carbohydrates', aliasedName, true,
      check: () => carbohydrates.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _dietaryFiberMeta =
      const VerificationMeta('dietaryFiber');
  @override
  late final GeneratedColumn<double> dietaryFiber = GeneratedColumn<double>(
      'dietary_fiber', aliasedName, true,
      check: () => dietaryFiber.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  @override
  late final GeneratedColumn<double> sugar = GeneratedColumn<double>(
      'sugar', aliasedName, true,
      check: () => sugar.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _fatTotalMeta =
      const VerificationMeta('fatTotal');
  @override
  late final GeneratedColumn<double> fatTotal = GeneratedColumn<double>(
      'fat_total', aliasedName, true,
      check: () => fatTotal.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _fatSaturedMeta =
      const VerificationMeta('fatSatured');
  @override
  late final GeneratedColumn<double> fatSatured = GeneratedColumn<double>(
      'fat_satured', aliasedName, true,
      check: () => fatSatured.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _fatMonounsaturatedMeta =
      const VerificationMeta('fatMonounsaturated');
  @override
  late final GeneratedColumn<double> fatMonounsaturated =
      GeneratedColumn<double>('fat_monounsaturated', aliasedName, true,
          check: () => fatMonounsaturated.isBiggerOrEqualValue(0),
          type: DriftSqlType.double,
          requiredDuringInsert: false);
  static const VerificationMeta _fatPolyunsaturatedMeta =
      const VerificationMeta('fatPolyunsaturated');
  @override
  late final GeneratedColumn<double> fatPolyunsaturated =
      GeneratedColumn<double>('fat_polyunsaturated', aliasedName, true,
          check: () => fatPolyunsaturated.isBiggerOrEqualValue(0),
          type: DriftSqlType.double,
          requiredDuringInsert: false);
  static const VerificationMeta _waterMeta = const VerificationMeta('water');
  @override
  late final GeneratedColumn<double> water = GeneratedColumn<double>(
      'water', aliasedName, true,
      check: () => water.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _cholesterolMeta =
      const VerificationMeta('cholesterol');
  @override
  late final GeneratedColumn<double> cholesterol = GeneratedColumn<double>(
      'cholesterol', aliasedName, true,
      check: () => cholesterol.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _sodiumMeta = const VerificationMeta('sodium');
  @override
  late final GeneratedColumn<double> sodium = GeneratedColumn<double>(
      'sodium', aliasedName, true,
      check: () => sodium.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminAMeta =
      const VerificationMeta('vitaminA');
  @override
  late final GeneratedColumn<double> vitaminA = GeneratedColumn<double>(
      'vitamin_a', aliasedName, true,
      check: () => vitaminA.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminB1Meta =
      const VerificationMeta('vitaminB1');
  @override
  late final GeneratedColumn<double> vitaminB1 = GeneratedColumn<double>(
      'vitamin_b1', aliasedName, true,
      check: () => vitaminB1.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminB11Meta =
      const VerificationMeta('vitaminB11');
  @override
  late final GeneratedColumn<double> vitaminB11 = GeneratedColumn<double>(
      'vitamin_b11', aliasedName, true,
      check: () => vitaminB11.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminB12Meta =
      const VerificationMeta('vitaminB12');
  @override
  late final GeneratedColumn<double> vitaminB12 = GeneratedColumn<double>(
      'vitamin_b12', aliasedName, true,
      check: () => vitaminB12.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminB2Meta =
      const VerificationMeta('vitaminB2');
  @override
  late final GeneratedColumn<double> vitaminB2 = GeneratedColumn<double>(
      'vitamin_b2', aliasedName, true,
      check: () => vitaminB2.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminB3Meta =
      const VerificationMeta('vitaminB3');
  @override
  late final GeneratedColumn<double> vitaminB3 = GeneratedColumn<double>(
      'vitamin_b3', aliasedName, true,
      check: () => vitaminB3.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminB5Meta =
      const VerificationMeta('vitaminB5');
  @override
  late final GeneratedColumn<double> vitaminB5 = GeneratedColumn<double>(
      'vitamin_b5', aliasedName, true,
      check: () => vitaminB5.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminB6Meta =
      const VerificationMeta('vitaminB6');
  @override
  late final GeneratedColumn<double> vitaminB6 = GeneratedColumn<double>(
      'vitamin_b6', aliasedName, true,
      check: () => vitaminB6.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminCMeta =
      const VerificationMeta('vitaminC');
  @override
  late final GeneratedColumn<double> vitaminC = GeneratedColumn<double>(
      'vitamin_c', aliasedName, true,
      check: () => vitaminC.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminDMeta =
      const VerificationMeta('vitaminD');
  @override
  late final GeneratedColumn<double> vitaminD = GeneratedColumn<double>(
      'vitamin_d', aliasedName, true,
      check: () => vitaminD.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminEMeta =
      const VerificationMeta('vitaminE');
  @override
  late final GeneratedColumn<double> vitaminE = GeneratedColumn<double>(
      'vitamin_e', aliasedName, true,
      check: () => vitaminE.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _vitaminKMeta =
      const VerificationMeta('vitaminK');
  @override
  late final GeneratedColumn<double> vitaminK = GeneratedColumn<double>(
      'vitamin_k', aliasedName, true,
      check: () => vitaminK.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _calciumMeta =
      const VerificationMeta('calcium');
  @override
  late final GeneratedColumn<double> calcium = GeneratedColumn<double>(
      'calcium', aliasedName, true,
      check: () => calcium.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _ironMeta = const VerificationMeta('iron');
  @override
  late final GeneratedColumn<double> iron = GeneratedColumn<double>(
      'iron', aliasedName, true,
      check: () => iron.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _phosphorusMeta =
      const VerificationMeta('phosphorus');
  @override
  late final GeneratedColumn<double> phosphorus = GeneratedColumn<double>(
      'phosphorus', aliasedName, true,
      check: () => phosphorus.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _magnesiumMeta =
      const VerificationMeta('magnesium');
  @override
  late final GeneratedColumn<double> magnesium = GeneratedColumn<double>(
      'magnesium', aliasedName, true,
      check: () => magnesium.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _manganeseMeta =
      const VerificationMeta('manganese');
  @override
  late final GeneratedColumn<double> manganese = GeneratedColumn<double>(
      'manganese', aliasedName, true,
      check: () => manganese.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _potassiumMeta =
      const VerificationMeta('potassium');
  @override
  late final GeneratedColumn<double> potassium = GeneratedColumn<double>(
      'potassium', aliasedName, true,
      check: () => potassium.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _copperMeta = const VerificationMeta('copper');
  @override
  late final GeneratedColumn<double> copper = GeneratedColumn<double>(
      'copper', aliasedName, true,
      check: () => copper.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _seleniumMeta =
      const VerificationMeta('selenium');
  @override
  late final GeneratedColumn<double> selenium = GeneratedColumn<double>(
      'selenium', aliasedName, true,
      check: () => selenium.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _zincMeta = const VerificationMeta('zinc');
  @override
  late final GeneratedColumn<double> zinc = GeneratedColumn<double>(
      'zinc', aliasedName, true,
      check: () => zinc.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        calories,
        protein,
        carbohydrates,
        dietaryFiber,
        sugar,
        fatTotal,
        fatSatured,
        fatMonounsaturated,
        fatPolyunsaturated,
        water,
        cholesterol,
        sodium,
        vitaminA,
        vitaminB1,
        vitaminB11,
        vitaminB12,
        vitaminB2,
        vitaminB3,
        vitaminB5,
        vitaminB6,
        vitaminC,
        vitaminD,
        vitaminE,
        vitaminK,
        calcium,
        iron,
        phosphorus,
        magnesium,
        manganese,
        potassium,
        copper,
        selenium,
        zinc
      ];
  @override
  String get aliasedName => _alias ?? 'foods';
  @override
  String get actualTableName => 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
          _carbohydratesMeta,
          carbohydrates.isAcceptableOrUnknown(
              data['carbohydrates']!, _carbohydratesMeta));
    }
    if (data.containsKey('dietary_fiber')) {
      context.handle(
          _dietaryFiberMeta,
          dietaryFiber.isAcceptableOrUnknown(
              data['dietary_fiber']!, _dietaryFiberMeta));
    }
    if (data.containsKey('sugar')) {
      context.handle(
          _sugarMeta, sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta));
    }
    if (data.containsKey('fat_total')) {
      context.handle(_fatTotalMeta,
          fatTotal.isAcceptableOrUnknown(data['fat_total']!, _fatTotalMeta));
    }
    if (data.containsKey('fat_satured')) {
      context.handle(
          _fatSaturedMeta,
          fatSatured.isAcceptableOrUnknown(
              data['fat_satured']!, _fatSaturedMeta));
    }
    if (data.containsKey('fat_monounsaturated')) {
      context.handle(
          _fatMonounsaturatedMeta,
          fatMonounsaturated.isAcceptableOrUnknown(
              data['fat_monounsaturated']!, _fatMonounsaturatedMeta));
    }
    if (data.containsKey('fat_polyunsaturated')) {
      context.handle(
          _fatPolyunsaturatedMeta,
          fatPolyunsaturated.isAcceptableOrUnknown(
              data['fat_polyunsaturated']!, _fatPolyunsaturatedMeta));
    }
    if (data.containsKey('water')) {
      context.handle(
          _waterMeta, water.isAcceptableOrUnknown(data['water']!, _waterMeta));
    }
    if (data.containsKey('cholesterol')) {
      context.handle(
          _cholesterolMeta,
          cholesterol.isAcceptableOrUnknown(
              data['cholesterol']!, _cholesterolMeta));
    }
    if (data.containsKey('sodium')) {
      context.handle(_sodiumMeta,
          sodium.isAcceptableOrUnknown(data['sodium']!, _sodiumMeta));
    }
    if (data.containsKey('vitamin_a')) {
      context.handle(_vitaminAMeta,
          vitaminA.isAcceptableOrUnknown(data['vitamin_a']!, _vitaminAMeta));
    }
    if (data.containsKey('vitamin_b1')) {
      context.handle(_vitaminB1Meta,
          vitaminB1.isAcceptableOrUnknown(data['vitamin_b1']!, _vitaminB1Meta));
    }
    if (data.containsKey('vitamin_b11')) {
      context.handle(
          _vitaminB11Meta,
          vitaminB11.isAcceptableOrUnknown(
              data['vitamin_b11']!, _vitaminB11Meta));
    }
    if (data.containsKey('vitamin_b12')) {
      context.handle(
          _vitaminB12Meta,
          vitaminB12.isAcceptableOrUnknown(
              data['vitamin_b12']!, _vitaminB12Meta));
    }
    if (data.containsKey('vitamin_b2')) {
      context.handle(_vitaminB2Meta,
          vitaminB2.isAcceptableOrUnknown(data['vitamin_b2']!, _vitaminB2Meta));
    }
    if (data.containsKey('vitamin_b3')) {
      context.handle(_vitaminB3Meta,
          vitaminB3.isAcceptableOrUnknown(data['vitamin_b3']!, _vitaminB3Meta));
    }
    if (data.containsKey('vitamin_b5')) {
      context.handle(_vitaminB5Meta,
          vitaminB5.isAcceptableOrUnknown(data['vitamin_b5']!, _vitaminB5Meta));
    }
    if (data.containsKey('vitamin_b6')) {
      context.handle(_vitaminB6Meta,
          vitaminB6.isAcceptableOrUnknown(data['vitamin_b6']!, _vitaminB6Meta));
    }
    if (data.containsKey('vitamin_c')) {
      context.handle(_vitaminCMeta,
          vitaminC.isAcceptableOrUnknown(data['vitamin_c']!, _vitaminCMeta));
    }
    if (data.containsKey('vitamin_d')) {
      context.handle(_vitaminDMeta,
          vitaminD.isAcceptableOrUnknown(data['vitamin_d']!, _vitaminDMeta));
    }
    if (data.containsKey('vitamin_e')) {
      context.handle(_vitaminEMeta,
          vitaminE.isAcceptableOrUnknown(data['vitamin_e']!, _vitaminEMeta));
    }
    if (data.containsKey('vitamin_k')) {
      context.handle(_vitaminKMeta,
          vitaminK.isAcceptableOrUnknown(data['vitamin_k']!, _vitaminKMeta));
    }
    if (data.containsKey('calcium')) {
      context.handle(_calciumMeta,
          calcium.isAcceptableOrUnknown(data['calcium']!, _calciumMeta));
    }
    if (data.containsKey('iron')) {
      context.handle(
          _ironMeta, iron.isAcceptableOrUnknown(data['iron']!, _ironMeta));
    }
    if (data.containsKey('phosphorus')) {
      context.handle(
          _phosphorusMeta,
          phosphorus.isAcceptableOrUnknown(
              data['phosphorus']!, _phosphorusMeta));
    }
    if (data.containsKey('magnesium')) {
      context.handle(_magnesiumMeta,
          magnesium.isAcceptableOrUnknown(data['magnesium']!, _magnesiumMeta));
    }
    if (data.containsKey('manganese')) {
      context.handle(_manganeseMeta,
          manganese.isAcceptableOrUnknown(data['manganese']!, _manganeseMeta));
    }
    if (data.containsKey('potassium')) {
      context.handle(_potassiumMeta,
          potassium.isAcceptableOrUnknown(data['potassium']!, _potassiumMeta));
    }
    if (data.containsKey('copper')) {
      context.handle(_copperMeta,
          copper.isAcceptableOrUnknown(data['copper']!, _copperMeta));
    }
    if (data.containsKey('selenium')) {
      context.handle(_seleniumMeta,
          selenium.isAcceptableOrUnknown(data['selenium']!, _seleniumMeta));
    }
    if (data.containsKey('zinc')) {
      context.handle(
          _zincMeta, zinc.isAcceptableOrUnknown(data['zinc']!, _zincMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Food(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calories']),
      protein: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein']),
      carbohydrates: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbohydrates']),
      dietaryFiber: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dietary_fiber']),
      sugar: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sugar']),
      fatTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_total']),
      fatSatured: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_satured']),
      fatMonounsaturated: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}fat_monounsaturated']),
      fatPolyunsaturated: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}fat_polyunsaturated']),
      water: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}water']),
      cholesterol: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cholesterol']),
      sodium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sodium']),
      vitaminA: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_a']),
      vitaminB1: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b1']),
      vitaminB11: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b11']),
      vitaminB12: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b12']),
      vitaminB2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b2']),
      vitaminB3: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b3']),
      vitaminB5: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b5']),
      vitaminB6: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b6']),
      vitaminC: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_c']),
      vitaminD: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_d']),
      vitaminE: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_e']),
      vitaminK: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_k']),
      calcium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calcium']),
      iron: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}iron']),
      phosphorus: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}phosphorus']),
      magnesium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}magnesium']),
      manganese: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}manganese']),
      potassium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}potassium']),
      copper: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}copper']),
      selenium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}selenium']),
      zinc: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}zinc']),
    );
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(attachedDatabase, alias);
  }
}

class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String? name;
  final double? calories;
  final double? protein;
  final double? carbohydrates;
  final double? dietaryFiber;
  final double? sugar;
  final double? fatTotal;
  final double? fatSatured;
  final double? fatMonounsaturated;
  final double? fatPolyunsaturated;
  final double? water;
  final double? cholesterol;
  final double? sodium;
  final double? vitaminA;
  final double? vitaminB1;
  final double? vitaminB11;
  final double? vitaminB12;
  final double? vitaminB2;
  final double? vitaminB3;
  final double? vitaminB5;
  final double? vitaminB6;
  final double? vitaminC;
  final double? vitaminD;
  final double? vitaminE;
  final double? vitaminK;
  final double? calcium;
  final double? iron;
  final double? phosphorus;
  final double? magnesium;
  final double? manganese;
  final double? potassium;
  final double? copper;
  final double? selenium;
  final double? zinc;
  const Food(
      {required this.id,
      this.name,
      this.calories,
      this.protein,
      this.carbohydrates,
      this.dietaryFiber,
      this.sugar,
      this.fatTotal,
      this.fatSatured,
      this.fatMonounsaturated,
      this.fatPolyunsaturated,
      this.water,
      this.cholesterol,
      this.sodium,
      this.vitaminA,
      this.vitaminB1,
      this.vitaminB11,
      this.vitaminB12,
      this.vitaminB2,
      this.vitaminB3,
      this.vitaminB5,
      this.vitaminB6,
      this.vitaminC,
      this.vitaminD,
      this.vitaminE,
      this.vitaminK,
      this.calcium,
      this.iron,
      this.phosphorus,
      this.magnesium,
      this.manganese,
      this.potassium,
      this.copper,
      this.selenium,
      this.zinc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<double>(calories);
    }
    if (!nullToAbsent || protein != null) {
      map['protein'] = Variable<double>(protein);
    }
    if (!nullToAbsent || carbohydrates != null) {
      map['carbohydrates'] = Variable<double>(carbohydrates);
    }
    if (!nullToAbsent || dietaryFiber != null) {
      map['dietary_fiber'] = Variable<double>(dietaryFiber);
    }
    if (!nullToAbsent || sugar != null) {
      map['sugar'] = Variable<double>(sugar);
    }
    if (!nullToAbsent || fatTotal != null) {
      map['fat_total'] = Variable<double>(fatTotal);
    }
    if (!nullToAbsent || fatSatured != null) {
      map['fat_satured'] = Variable<double>(fatSatured);
    }
    if (!nullToAbsent || fatMonounsaturated != null) {
      map['fat_monounsaturated'] = Variable<double>(fatMonounsaturated);
    }
    if (!nullToAbsent || fatPolyunsaturated != null) {
      map['fat_polyunsaturated'] = Variable<double>(fatPolyunsaturated);
    }
    if (!nullToAbsent || water != null) {
      map['water'] = Variable<double>(water);
    }
    if (!nullToAbsent || cholesterol != null) {
      map['cholesterol'] = Variable<double>(cholesterol);
    }
    if (!nullToAbsent || sodium != null) {
      map['sodium'] = Variable<double>(sodium);
    }
    if (!nullToAbsent || vitaminA != null) {
      map['vitamin_a'] = Variable<double>(vitaminA);
    }
    if (!nullToAbsent || vitaminB1 != null) {
      map['vitamin_b1'] = Variable<double>(vitaminB1);
    }
    if (!nullToAbsent || vitaminB11 != null) {
      map['vitamin_b11'] = Variable<double>(vitaminB11);
    }
    if (!nullToAbsent || vitaminB12 != null) {
      map['vitamin_b12'] = Variable<double>(vitaminB12);
    }
    if (!nullToAbsent || vitaminB2 != null) {
      map['vitamin_b2'] = Variable<double>(vitaminB2);
    }
    if (!nullToAbsent || vitaminB3 != null) {
      map['vitamin_b3'] = Variable<double>(vitaminB3);
    }
    if (!nullToAbsent || vitaminB5 != null) {
      map['vitamin_b5'] = Variable<double>(vitaminB5);
    }
    if (!nullToAbsent || vitaminB6 != null) {
      map['vitamin_b6'] = Variable<double>(vitaminB6);
    }
    if (!nullToAbsent || vitaminC != null) {
      map['vitamin_c'] = Variable<double>(vitaminC);
    }
    if (!nullToAbsent || vitaminD != null) {
      map['vitamin_d'] = Variable<double>(vitaminD);
    }
    if (!nullToAbsent || vitaminE != null) {
      map['vitamin_e'] = Variable<double>(vitaminE);
    }
    if (!nullToAbsent || vitaminK != null) {
      map['vitamin_k'] = Variable<double>(vitaminK);
    }
    if (!nullToAbsent || calcium != null) {
      map['calcium'] = Variable<double>(calcium);
    }
    if (!nullToAbsent || iron != null) {
      map['iron'] = Variable<double>(iron);
    }
    if (!nullToAbsent || phosphorus != null) {
      map['phosphorus'] = Variable<double>(phosphorus);
    }
    if (!nullToAbsent || magnesium != null) {
      map['magnesium'] = Variable<double>(magnesium);
    }
    if (!nullToAbsent || manganese != null) {
      map['manganese'] = Variable<double>(manganese);
    }
    if (!nullToAbsent || potassium != null) {
      map['potassium'] = Variable<double>(potassium);
    }
    if (!nullToAbsent || copper != null) {
      map['copper'] = Variable<double>(copper);
    }
    if (!nullToAbsent || selenium != null) {
      map['selenium'] = Variable<double>(selenium);
    }
    if (!nullToAbsent || zinc != null) {
      map['zinc'] = Variable<double>(zinc);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      protein: protein == null && nullToAbsent
          ? const Value.absent()
          : Value(protein),
      carbohydrates: carbohydrates == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrates),
      dietaryFiber: dietaryFiber == null && nullToAbsent
          ? const Value.absent()
          : Value(dietaryFiber),
      sugar:
          sugar == null && nullToAbsent ? const Value.absent() : Value(sugar),
      fatTotal: fatTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(fatTotal),
      fatSatured: fatSatured == null && nullToAbsent
          ? const Value.absent()
          : Value(fatSatured),
      fatMonounsaturated: fatMonounsaturated == null && nullToAbsent
          ? const Value.absent()
          : Value(fatMonounsaturated),
      fatPolyunsaturated: fatPolyunsaturated == null && nullToAbsent
          ? const Value.absent()
          : Value(fatPolyunsaturated),
      water:
          water == null && nullToAbsent ? const Value.absent() : Value(water),
      cholesterol: cholesterol == null && nullToAbsent
          ? const Value.absent()
          : Value(cholesterol),
      sodium:
          sodium == null && nullToAbsent ? const Value.absent() : Value(sodium),
      vitaminA: vitaminA == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminA),
      vitaminB1: vitaminB1 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB1),
      vitaminB11: vitaminB11 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB11),
      vitaminB12: vitaminB12 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB12),
      vitaminB2: vitaminB2 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB2),
      vitaminB3: vitaminB3 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB3),
      vitaminB5: vitaminB5 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB5),
      vitaminB6: vitaminB6 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB6),
      vitaminC: vitaminC == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminC),
      vitaminD: vitaminD == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminD),
      vitaminE: vitaminE == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminE),
      vitaminK: vitaminK == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminK),
      calcium: calcium == null && nullToAbsent
          ? const Value.absent()
          : Value(calcium),
      iron: iron == null && nullToAbsent ? const Value.absent() : Value(iron),
      phosphorus: phosphorus == null && nullToAbsent
          ? const Value.absent()
          : Value(phosphorus),
      magnesium: magnesium == null && nullToAbsent
          ? const Value.absent()
          : Value(magnesium),
      manganese: manganese == null && nullToAbsent
          ? const Value.absent()
          : Value(manganese),
      potassium: potassium == null && nullToAbsent
          ? const Value.absent()
          : Value(potassium),
      copper:
          copper == null && nullToAbsent ? const Value.absent() : Value(copper),
      selenium: selenium == null && nullToAbsent
          ? const Value.absent()
          : Value(selenium),
      zinc: zinc == null && nullToAbsent ? const Value.absent() : Value(zinc),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      calories: serializer.fromJson<double?>(json['calories']),
      protein: serializer.fromJson<double?>(json['protein']),
      carbohydrates: serializer.fromJson<double?>(json['carbohydrates']),
      dietaryFiber: serializer.fromJson<double?>(json['dietaryFiber']),
      sugar: serializer.fromJson<double?>(json['sugar']),
      fatTotal: serializer.fromJson<double?>(json['fatTotal']),
      fatSatured: serializer.fromJson<double?>(json['fatSatured']),
      fatMonounsaturated:
          serializer.fromJson<double?>(json['fatMonounsaturated']),
      fatPolyunsaturated:
          serializer.fromJson<double?>(json['fatPolyunsaturated']),
      water: serializer.fromJson<double?>(json['water']),
      cholesterol: serializer.fromJson<double?>(json['cholesterol']),
      sodium: serializer.fromJson<double?>(json['sodium']),
      vitaminA: serializer.fromJson<double?>(json['vitaminA']),
      vitaminB1: serializer.fromJson<double?>(json['vitaminB1']),
      vitaminB11: serializer.fromJson<double?>(json['vitaminB11']),
      vitaminB12: serializer.fromJson<double?>(json['vitaminB12']),
      vitaminB2: serializer.fromJson<double?>(json['vitaminB2']),
      vitaminB3: serializer.fromJson<double?>(json['vitaminB3']),
      vitaminB5: serializer.fromJson<double?>(json['vitaminB5']),
      vitaminB6: serializer.fromJson<double?>(json['vitaminB6']),
      vitaminC: serializer.fromJson<double?>(json['vitaminC']),
      vitaminD: serializer.fromJson<double?>(json['vitaminD']),
      vitaminE: serializer.fromJson<double?>(json['vitaminE']),
      vitaminK: serializer.fromJson<double?>(json['vitaminK']),
      calcium: serializer.fromJson<double?>(json['calcium']),
      iron: serializer.fromJson<double?>(json['iron']),
      phosphorus: serializer.fromJson<double?>(json['phosphorus']),
      magnesium: serializer.fromJson<double?>(json['magnesium']),
      manganese: serializer.fromJson<double?>(json['manganese']),
      potassium: serializer.fromJson<double?>(json['potassium']),
      copper: serializer.fromJson<double?>(json['copper']),
      selenium: serializer.fromJson<double?>(json['selenium']),
      zinc: serializer.fromJson<double?>(json['zinc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'calories': serializer.toJson<double?>(calories),
      'protein': serializer.toJson<double?>(protein),
      'carbohydrates': serializer.toJson<double?>(carbohydrates),
      'dietaryFiber': serializer.toJson<double?>(dietaryFiber),
      'sugar': serializer.toJson<double?>(sugar),
      'fatTotal': serializer.toJson<double?>(fatTotal),
      'fatSatured': serializer.toJson<double?>(fatSatured),
      'fatMonounsaturated': serializer.toJson<double?>(fatMonounsaturated),
      'fatPolyunsaturated': serializer.toJson<double?>(fatPolyunsaturated),
      'water': serializer.toJson<double?>(water),
      'cholesterol': serializer.toJson<double?>(cholesterol),
      'sodium': serializer.toJson<double?>(sodium),
      'vitaminA': serializer.toJson<double?>(vitaminA),
      'vitaminB1': serializer.toJson<double?>(vitaminB1),
      'vitaminB11': serializer.toJson<double?>(vitaminB11),
      'vitaminB12': serializer.toJson<double?>(vitaminB12),
      'vitaminB2': serializer.toJson<double?>(vitaminB2),
      'vitaminB3': serializer.toJson<double?>(vitaminB3),
      'vitaminB5': serializer.toJson<double?>(vitaminB5),
      'vitaminB6': serializer.toJson<double?>(vitaminB6),
      'vitaminC': serializer.toJson<double?>(vitaminC),
      'vitaminD': serializer.toJson<double?>(vitaminD),
      'vitaminE': serializer.toJson<double?>(vitaminE),
      'vitaminK': serializer.toJson<double?>(vitaminK),
      'calcium': serializer.toJson<double?>(calcium),
      'iron': serializer.toJson<double?>(iron),
      'phosphorus': serializer.toJson<double?>(phosphorus),
      'magnesium': serializer.toJson<double?>(magnesium),
      'manganese': serializer.toJson<double?>(manganese),
      'potassium': serializer.toJson<double?>(potassium),
      'copper': serializer.toJson<double?>(copper),
      'selenium': serializer.toJson<double?>(selenium),
      'zinc': serializer.toJson<double?>(zinc),
    };
  }

  Food copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<double?> calories = const Value.absent(),
          Value<double?> protein = const Value.absent(),
          Value<double?> carbohydrates = const Value.absent(),
          Value<double?> dietaryFiber = const Value.absent(),
          Value<double?> sugar = const Value.absent(),
          Value<double?> fatTotal = const Value.absent(),
          Value<double?> fatSatured = const Value.absent(),
          Value<double?> fatMonounsaturated = const Value.absent(),
          Value<double?> fatPolyunsaturated = const Value.absent(),
          Value<double?> water = const Value.absent(),
          Value<double?> cholesterol = const Value.absent(),
          Value<double?> sodium = const Value.absent(),
          Value<double?> vitaminA = const Value.absent(),
          Value<double?> vitaminB1 = const Value.absent(),
          Value<double?> vitaminB11 = const Value.absent(),
          Value<double?> vitaminB12 = const Value.absent(),
          Value<double?> vitaminB2 = const Value.absent(),
          Value<double?> vitaminB3 = const Value.absent(),
          Value<double?> vitaminB5 = const Value.absent(),
          Value<double?> vitaminB6 = const Value.absent(),
          Value<double?> vitaminC = const Value.absent(),
          Value<double?> vitaminD = const Value.absent(),
          Value<double?> vitaminE = const Value.absent(),
          Value<double?> vitaminK = const Value.absent(),
          Value<double?> calcium = const Value.absent(),
          Value<double?> iron = const Value.absent(),
          Value<double?> phosphorus = const Value.absent(),
          Value<double?> magnesium = const Value.absent(),
          Value<double?> manganese = const Value.absent(),
          Value<double?> potassium = const Value.absent(),
          Value<double?> copper = const Value.absent(),
          Value<double?> selenium = const Value.absent(),
          Value<double?> zinc = const Value.absent()}) =>
      Food(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        calories: calories.present ? calories.value : this.calories,
        protein: protein.present ? protein.value : this.protein,
        carbohydrates:
            carbohydrates.present ? carbohydrates.value : this.carbohydrates,
        dietaryFiber:
            dietaryFiber.present ? dietaryFiber.value : this.dietaryFiber,
        sugar: sugar.present ? sugar.value : this.sugar,
        fatTotal: fatTotal.present ? fatTotal.value : this.fatTotal,
        fatSatured: fatSatured.present ? fatSatured.value : this.fatSatured,
        fatMonounsaturated: fatMonounsaturated.present
            ? fatMonounsaturated.value
            : this.fatMonounsaturated,
        fatPolyunsaturated: fatPolyunsaturated.present
            ? fatPolyunsaturated.value
            : this.fatPolyunsaturated,
        water: water.present ? water.value : this.water,
        cholesterol: cholesterol.present ? cholesterol.value : this.cholesterol,
        sodium: sodium.present ? sodium.value : this.sodium,
        vitaminA: vitaminA.present ? vitaminA.value : this.vitaminA,
        vitaminB1: vitaminB1.present ? vitaminB1.value : this.vitaminB1,
        vitaminB11: vitaminB11.present ? vitaminB11.value : this.vitaminB11,
        vitaminB12: vitaminB12.present ? vitaminB12.value : this.vitaminB12,
        vitaminB2: vitaminB2.present ? vitaminB2.value : this.vitaminB2,
        vitaminB3: vitaminB3.present ? vitaminB3.value : this.vitaminB3,
        vitaminB5: vitaminB5.present ? vitaminB5.value : this.vitaminB5,
        vitaminB6: vitaminB6.present ? vitaminB6.value : this.vitaminB6,
        vitaminC: vitaminC.present ? vitaminC.value : this.vitaminC,
        vitaminD: vitaminD.present ? vitaminD.value : this.vitaminD,
        vitaminE: vitaminE.present ? vitaminE.value : this.vitaminE,
        vitaminK: vitaminK.present ? vitaminK.value : this.vitaminK,
        calcium: calcium.present ? calcium.value : this.calcium,
        iron: iron.present ? iron.value : this.iron,
        phosphorus: phosphorus.present ? phosphorus.value : this.phosphorus,
        magnesium: magnesium.present ? magnesium.value : this.magnesium,
        manganese: manganese.present ? manganese.value : this.manganese,
        potassium: potassium.present ? potassium.value : this.potassium,
        copper: copper.present ? copper.value : this.copper,
        selenium: selenium.present ? selenium.value : this.selenium,
        zinc: zinc.present ? zinc.value : this.zinc,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('dietaryFiber: $dietaryFiber, ')
          ..write('sugar: $sugar, ')
          ..write('fatTotal: $fatTotal, ')
          ..write('fatSatured: $fatSatured, ')
          ..write('fatMonounsaturated: $fatMonounsaturated, ')
          ..write('fatPolyunsaturated: $fatPolyunsaturated, ')
          ..write('water: $water, ')
          ..write('cholesterol: $cholesterol, ')
          ..write('sodium: $sodium, ')
          ..write('vitaminA: $vitaminA, ')
          ..write('vitaminB1: $vitaminB1, ')
          ..write('vitaminB11: $vitaminB11, ')
          ..write('vitaminB12: $vitaminB12, ')
          ..write('vitaminB2: $vitaminB2, ')
          ..write('vitaminB3: $vitaminB3, ')
          ..write('vitaminB5: $vitaminB5, ')
          ..write('vitaminB6: $vitaminB6, ')
          ..write('vitaminC: $vitaminC, ')
          ..write('vitaminD: $vitaminD, ')
          ..write('vitaminE: $vitaminE, ')
          ..write('vitaminK: $vitaminK, ')
          ..write('calcium: $calcium, ')
          ..write('iron: $iron, ')
          ..write('phosphorus: $phosphorus, ')
          ..write('magnesium: $magnesium, ')
          ..write('manganese: $manganese, ')
          ..write('potassium: $potassium, ')
          ..write('copper: $copper, ')
          ..write('selenium: $selenium, ')
          ..write('zinc: $zinc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        calories,
        protein,
        carbohydrates,
        dietaryFiber,
        sugar,
        fatTotal,
        fatSatured,
        fatMonounsaturated,
        fatPolyunsaturated,
        water,
        cholesterol,
        sodium,
        vitaminA,
        vitaminB1,
        vitaminB11,
        vitaminB12,
        vitaminB2,
        vitaminB3,
        vitaminB5,
        vitaminB6,
        vitaminC,
        vitaminD,
        vitaminE,
        vitaminK,
        calcium,
        iron,
        phosphorus,
        magnesium,
        manganese,
        potassium,
        copper,
        selenium,
        zinc
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbohydrates == this.carbohydrates &&
          other.dietaryFiber == this.dietaryFiber &&
          other.sugar == this.sugar &&
          other.fatTotal == this.fatTotal &&
          other.fatSatured == this.fatSatured &&
          other.fatMonounsaturated == this.fatMonounsaturated &&
          other.fatPolyunsaturated == this.fatPolyunsaturated &&
          other.water == this.water &&
          other.cholesterol == this.cholesterol &&
          other.sodium == this.sodium &&
          other.vitaminA == this.vitaminA &&
          other.vitaminB1 == this.vitaminB1 &&
          other.vitaminB11 == this.vitaminB11 &&
          other.vitaminB12 == this.vitaminB12 &&
          other.vitaminB2 == this.vitaminB2 &&
          other.vitaminB3 == this.vitaminB3 &&
          other.vitaminB5 == this.vitaminB5 &&
          other.vitaminB6 == this.vitaminB6 &&
          other.vitaminC == this.vitaminC &&
          other.vitaminD == this.vitaminD &&
          other.vitaminE == this.vitaminE &&
          other.vitaminK == this.vitaminK &&
          other.calcium == this.calcium &&
          other.iron == this.iron &&
          other.phosphorus == this.phosphorus &&
          other.magnesium == this.magnesium &&
          other.manganese == this.manganese &&
          other.potassium == this.potassium &&
          other.copper == this.copper &&
          other.selenium == this.selenium &&
          other.zinc == this.zinc);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String?> name;
  final Value<double?> calories;
  final Value<double?> protein;
  final Value<double?> carbohydrates;
  final Value<double?> dietaryFiber;
  final Value<double?> sugar;
  final Value<double?> fatTotal;
  final Value<double?> fatSatured;
  final Value<double?> fatMonounsaturated;
  final Value<double?> fatPolyunsaturated;
  final Value<double?> water;
  final Value<double?> cholesterol;
  final Value<double?> sodium;
  final Value<double?> vitaminA;
  final Value<double?> vitaminB1;
  final Value<double?> vitaminB11;
  final Value<double?> vitaminB12;
  final Value<double?> vitaminB2;
  final Value<double?> vitaminB3;
  final Value<double?> vitaminB5;
  final Value<double?> vitaminB6;
  final Value<double?> vitaminC;
  final Value<double?> vitaminD;
  final Value<double?> vitaminE;
  final Value<double?> vitaminK;
  final Value<double?> calcium;
  final Value<double?> iron;
  final Value<double?> phosphorus;
  final Value<double?> magnesium;
  final Value<double?> manganese;
  final Value<double?> potassium;
  final Value<double?> copper;
  final Value<double?> selenium;
  final Value<double?> zinc;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.dietaryFiber = const Value.absent(),
    this.sugar = const Value.absent(),
    this.fatTotal = const Value.absent(),
    this.fatSatured = const Value.absent(),
    this.fatMonounsaturated = const Value.absent(),
    this.fatPolyunsaturated = const Value.absent(),
    this.water = const Value.absent(),
    this.cholesterol = const Value.absent(),
    this.sodium = const Value.absent(),
    this.vitaminA = const Value.absent(),
    this.vitaminB1 = const Value.absent(),
    this.vitaminB11 = const Value.absent(),
    this.vitaminB12 = const Value.absent(),
    this.vitaminB2 = const Value.absent(),
    this.vitaminB3 = const Value.absent(),
    this.vitaminB5 = const Value.absent(),
    this.vitaminB6 = const Value.absent(),
    this.vitaminC = const Value.absent(),
    this.vitaminD = const Value.absent(),
    this.vitaminE = const Value.absent(),
    this.vitaminK = const Value.absent(),
    this.calcium = const Value.absent(),
    this.iron = const Value.absent(),
    this.phosphorus = const Value.absent(),
    this.magnesium = const Value.absent(),
    this.manganese = const Value.absent(),
    this.potassium = const Value.absent(),
    this.copper = const Value.absent(),
    this.selenium = const Value.absent(),
    this.zinc = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.dietaryFiber = const Value.absent(),
    this.sugar = const Value.absent(),
    this.fatTotal = const Value.absent(),
    this.fatSatured = const Value.absent(),
    this.fatMonounsaturated = const Value.absent(),
    this.fatPolyunsaturated = const Value.absent(),
    this.water = const Value.absent(),
    this.cholesterol = const Value.absent(),
    this.sodium = const Value.absent(),
    this.vitaminA = const Value.absent(),
    this.vitaminB1 = const Value.absent(),
    this.vitaminB11 = const Value.absent(),
    this.vitaminB12 = const Value.absent(),
    this.vitaminB2 = const Value.absent(),
    this.vitaminB3 = const Value.absent(),
    this.vitaminB5 = const Value.absent(),
    this.vitaminB6 = const Value.absent(),
    this.vitaminC = const Value.absent(),
    this.vitaminD = const Value.absent(),
    this.vitaminE = const Value.absent(),
    this.vitaminK = const Value.absent(),
    this.calcium = const Value.absent(),
    this.iron = const Value.absent(),
    this.phosphorus = const Value.absent(),
    this.magnesium = const Value.absent(),
    this.manganese = const Value.absent(),
    this.potassium = const Value.absent(),
    this.copper = const Value.absent(),
    this.selenium = const Value.absent(),
    this.zinc = const Value.absent(),
  });
  static Insertable<Food> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? calories,
    Expression<double>? protein,
    Expression<double>? carbohydrates,
    Expression<double>? dietaryFiber,
    Expression<double>? sugar,
    Expression<double>? fatTotal,
    Expression<double>? fatSatured,
    Expression<double>? fatMonounsaturated,
    Expression<double>? fatPolyunsaturated,
    Expression<double>? water,
    Expression<double>? cholesterol,
    Expression<double>? sodium,
    Expression<double>? vitaminA,
    Expression<double>? vitaminB1,
    Expression<double>? vitaminB11,
    Expression<double>? vitaminB12,
    Expression<double>? vitaminB2,
    Expression<double>? vitaminB3,
    Expression<double>? vitaminB5,
    Expression<double>? vitaminB6,
    Expression<double>? vitaminC,
    Expression<double>? vitaminD,
    Expression<double>? vitaminE,
    Expression<double>? vitaminK,
    Expression<double>? calcium,
    Expression<double>? iron,
    Expression<double>? phosphorus,
    Expression<double>? magnesium,
    Expression<double>? manganese,
    Expression<double>? potassium,
    Expression<double>? copper,
    Expression<double>? selenium,
    Expression<double>? zinc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (dietaryFiber != null) 'dietary_fiber': dietaryFiber,
      if (sugar != null) 'sugar': sugar,
      if (fatTotal != null) 'fat_total': fatTotal,
      if (fatSatured != null) 'fat_satured': fatSatured,
      if (fatMonounsaturated != null) 'fat_monounsaturated': fatMonounsaturated,
      if (fatPolyunsaturated != null) 'fat_polyunsaturated': fatPolyunsaturated,
      if (water != null) 'water': water,
      if (cholesterol != null) 'cholesterol': cholesterol,
      if (sodium != null) 'sodium': sodium,
      if (vitaminA != null) 'vitamin_a': vitaminA,
      if (vitaminB1 != null) 'vitamin_b1': vitaminB1,
      if (vitaminB11 != null) 'vitamin_b11': vitaminB11,
      if (vitaminB12 != null) 'vitamin_b12': vitaminB12,
      if (vitaminB2 != null) 'vitamin_b2': vitaminB2,
      if (vitaminB3 != null) 'vitamin_b3': vitaminB3,
      if (vitaminB5 != null) 'vitamin_b5': vitaminB5,
      if (vitaminB6 != null) 'vitamin_b6': vitaminB6,
      if (vitaminC != null) 'vitamin_c': vitaminC,
      if (vitaminD != null) 'vitamin_d': vitaminD,
      if (vitaminE != null) 'vitamin_e': vitaminE,
      if (vitaminK != null) 'vitamin_k': vitaminK,
      if (calcium != null) 'calcium': calcium,
      if (iron != null) 'iron': iron,
      if (phosphorus != null) 'phosphorus': phosphorus,
      if (magnesium != null) 'magnesium': magnesium,
      if (manganese != null) 'manganese': manganese,
      if (potassium != null) 'potassium': potassium,
      if (copper != null) 'copper': copper,
      if (selenium != null) 'selenium': selenium,
      if (zinc != null) 'zinc': zinc,
    });
  }

  FoodsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<double?>? calories,
      Value<double?>? protein,
      Value<double?>? carbohydrates,
      Value<double?>? dietaryFiber,
      Value<double?>? sugar,
      Value<double?>? fatTotal,
      Value<double?>? fatSatured,
      Value<double?>? fatMonounsaturated,
      Value<double?>? fatPolyunsaturated,
      Value<double?>? water,
      Value<double?>? cholesterol,
      Value<double?>? sodium,
      Value<double?>? vitaminA,
      Value<double?>? vitaminB1,
      Value<double?>? vitaminB11,
      Value<double?>? vitaminB12,
      Value<double?>? vitaminB2,
      Value<double?>? vitaminB3,
      Value<double?>? vitaminB5,
      Value<double?>? vitaminB6,
      Value<double?>? vitaminC,
      Value<double?>? vitaminD,
      Value<double?>? vitaminE,
      Value<double?>? vitaminK,
      Value<double?>? calcium,
      Value<double?>? iron,
      Value<double?>? phosphorus,
      Value<double?>? magnesium,
      Value<double?>? manganese,
      Value<double?>? potassium,
      Value<double?>? copper,
      Value<double?>? selenium,
      Value<double?>? zinc}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      dietaryFiber: dietaryFiber ?? this.dietaryFiber,
      sugar: sugar ?? this.sugar,
      fatTotal: fatTotal ?? this.fatTotal,
      fatSatured: fatSatured ?? this.fatSatured,
      fatMonounsaturated: fatMonounsaturated ?? this.fatMonounsaturated,
      fatPolyunsaturated: fatPolyunsaturated ?? this.fatPolyunsaturated,
      water: water ?? this.water,
      cholesterol: cholesterol ?? this.cholesterol,
      sodium: sodium ?? this.sodium,
      vitaminA: vitaminA ?? this.vitaminA,
      vitaminB1: vitaminB1 ?? this.vitaminB1,
      vitaminB11: vitaminB11 ?? this.vitaminB11,
      vitaminB12: vitaminB12 ?? this.vitaminB12,
      vitaminB2: vitaminB2 ?? this.vitaminB2,
      vitaminB3: vitaminB3 ?? this.vitaminB3,
      vitaminB5: vitaminB5 ?? this.vitaminB5,
      vitaminB6: vitaminB6 ?? this.vitaminB6,
      vitaminC: vitaminC ?? this.vitaminC,
      vitaminD: vitaminD ?? this.vitaminD,
      vitaminE: vitaminE ?? this.vitaminE,
      vitaminK: vitaminK ?? this.vitaminK,
      calcium: calcium ?? this.calcium,
      iron: iron ?? this.iron,
      phosphorus: phosphorus ?? this.phosphorus,
      magnesium: magnesium ?? this.magnesium,
      manganese: manganese ?? this.manganese,
      potassium: potassium ?? this.potassium,
      copper: copper ?? this.copper,
      selenium: selenium ?? this.selenium,
      zinc: zinc ?? this.zinc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<double>(carbohydrates.value);
    }
    if (dietaryFiber.present) {
      map['dietary_fiber'] = Variable<double>(dietaryFiber.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    if (fatTotal.present) {
      map['fat_total'] = Variable<double>(fatTotal.value);
    }
    if (fatSatured.present) {
      map['fat_satured'] = Variable<double>(fatSatured.value);
    }
    if (fatMonounsaturated.present) {
      map['fat_monounsaturated'] = Variable<double>(fatMonounsaturated.value);
    }
    if (fatPolyunsaturated.present) {
      map['fat_polyunsaturated'] = Variable<double>(fatPolyunsaturated.value);
    }
    if (water.present) {
      map['water'] = Variable<double>(water.value);
    }
    if (cholesterol.present) {
      map['cholesterol'] = Variable<double>(cholesterol.value);
    }
    if (sodium.present) {
      map['sodium'] = Variable<double>(sodium.value);
    }
    if (vitaminA.present) {
      map['vitamin_a'] = Variable<double>(vitaminA.value);
    }
    if (vitaminB1.present) {
      map['vitamin_b1'] = Variable<double>(vitaminB1.value);
    }
    if (vitaminB11.present) {
      map['vitamin_b11'] = Variable<double>(vitaminB11.value);
    }
    if (vitaminB12.present) {
      map['vitamin_b12'] = Variable<double>(vitaminB12.value);
    }
    if (vitaminB2.present) {
      map['vitamin_b2'] = Variable<double>(vitaminB2.value);
    }
    if (vitaminB3.present) {
      map['vitamin_b3'] = Variable<double>(vitaminB3.value);
    }
    if (vitaminB5.present) {
      map['vitamin_b5'] = Variable<double>(vitaminB5.value);
    }
    if (vitaminB6.present) {
      map['vitamin_b6'] = Variable<double>(vitaminB6.value);
    }
    if (vitaminC.present) {
      map['vitamin_c'] = Variable<double>(vitaminC.value);
    }
    if (vitaminD.present) {
      map['vitamin_d'] = Variable<double>(vitaminD.value);
    }
    if (vitaminE.present) {
      map['vitamin_e'] = Variable<double>(vitaminE.value);
    }
    if (vitaminK.present) {
      map['vitamin_k'] = Variable<double>(vitaminK.value);
    }
    if (calcium.present) {
      map['calcium'] = Variable<double>(calcium.value);
    }
    if (iron.present) {
      map['iron'] = Variable<double>(iron.value);
    }
    if (phosphorus.present) {
      map['phosphorus'] = Variable<double>(phosphorus.value);
    }
    if (magnesium.present) {
      map['magnesium'] = Variable<double>(magnesium.value);
    }
    if (manganese.present) {
      map['manganese'] = Variable<double>(manganese.value);
    }
    if (potassium.present) {
      map['potassium'] = Variable<double>(potassium.value);
    }
    if (copper.present) {
      map['copper'] = Variable<double>(copper.value);
    }
    if (selenium.present) {
      map['selenium'] = Variable<double>(selenium.value);
    }
    if (zinc.present) {
      map['zinc'] = Variable<double>(zinc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('dietaryFiber: $dietaryFiber, ')
          ..write('sugar: $sugar, ')
          ..write('fatTotal: $fatTotal, ')
          ..write('fatSatured: $fatSatured, ')
          ..write('fatMonounsaturated: $fatMonounsaturated, ')
          ..write('fatPolyunsaturated: $fatPolyunsaturated, ')
          ..write('water: $water, ')
          ..write('cholesterol: $cholesterol, ')
          ..write('sodium: $sodium, ')
          ..write('vitaminA: $vitaminA, ')
          ..write('vitaminB1: $vitaminB1, ')
          ..write('vitaminB11: $vitaminB11, ')
          ..write('vitaminB12: $vitaminB12, ')
          ..write('vitaminB2: $vitaminB2, ')
          ..write('vitaminB3: $vitaminB3, ')
          ..write('vitaminB5: $vitaminB5, ')
          ..write('vitaminB6: $vitaminB6, ')
          ..write('vitaminC: $vitaminC, ')
          ..write('vitaminD: $vitaminD, ')
          ..write('vitaminE: $vitaminE, ')
          ..write('vitaminK: $vitaminK, ')
          ..write('calcium: $calcium, ')
          ..write('iron: $iron, ')
          ..write('phosphorus: $phosphorus, ')
          ..write('magnesium: $magnesium, ')
          ..write('manganese: $manganese, ')
          ..write('potassium: $potassium, ')
          ..write('copper: $copper, ')
          ..write('selenium: $selenium, ')
          ..write('zinc: $zinc')
          ..write(')'))
        .toString();
  }
}

class $VisitsTable extends Visits with TableInfo<$VisitsTable, Visit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patients (id)'));
  static const VerificationMeta _eventNameMeta =
      const VerificationMeta('eventName');
  @override
  late final GeneratedColumn<String> eventName = GeneratedColumn<String>(
      'event_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isAllDayMeta =
      const VerificationMeta('isAllDay');
  @override
  late final GeneratedColumn<bool> isAllDay =
      GeneratedColumn<bool>('is_all_day', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_all_day" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<DateTime> from = GeneratedColumn<DateTime>(
      'from', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<DateTime> to = GeneratedColumn<DateTime>(
      'to', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      check: () => weight.isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backgroundMeta =
      const VerificationMeta('background');
  @override
  late final GeneratedColumnWithTypeConverter<Color, String> background =
      GeneratedColumn<String>('background', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(Colors.blue.value.toString()))
          .withConverter<Color>($VisitsTable.$converterbackground);
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone =
      GeneratedColumn<bool>('is_done', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_done" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _isCanceledMeta =
      const VerificationMeta('isCanceled');
  @override
  late final GeneratedColumn<bool> isCanceled =
      GeneratedColumn<bool>('is_canceled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_canceled" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _isInitialMeta =
      const VerificationMeta('isInitial');
  @override
  late final GeneratedColumn<bool> isInitial =
      GeneratedColumn<bool>('is_initial', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_initial" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        eventName,
        isAllDay,
        from,
        to,
        weight,
        notes,
        background,
        isDone,
        isCanceled,
        isInitial
      ];
  @override
  String get aliasedName => _alias ?? 'visits';
  @override
  String get actualTableName => 'visits';
  @override
  VerificationContext validateIntegrity(Insertable<Visit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name']!, _eventNameMeta));
    } else if (isInserting) {
      context.missing(_eventNameMeta);
    }
    if (data.containsKey('is_all_day')) {
      context.handle(_isAllDayMeta,
          isAllDay.isAcceptableOrUnknown(data['is_all_day']!, _isAllDayMeta));
    }
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    } else if (isInserting) {
      context.missing(_fromMeta);
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    context.handle(_backgroundMeta, const VerificationResult.success());
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    }
    if (data.containsKey('is_canceled')) {
      context.handle(
          _isCanceledMeta,
          isCanceled.isAcceptableOrUnknown(
              data['is_canceled']!, _isCanceledMeta));
    }
    if (data.containsKey('is_initial')) {
      context.handle(_isInitialMeta,
          isInitial.isAcceptableOrUnknown(data['is_initial']!, _isInitialMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Visit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      eventName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_name'])!,
      isAllDay: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_all_day'])!,
      from: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}from'])!,
      to: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}to'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      background: $VisitsTable.$converterbackground.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}background'])!),
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
      isCanceled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_canceled'])!,
      isInitial: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_initial'])!,
    );
  }

  @override
  $VisitsTable createAlias(String alias) {
    return $VisitsTable(attachedDatabase, alias);
  }

  static TypeConverter<Color, String> $converterbackground =
      const ColorConverter();
}

class Visit extends DataClass implements Insertable<Visit> {
  final int id;
  final int patientId;
  final String eventName;
  final bool isAllDay;
  final DateTime from;
  final DateTime to;
  final double? weight;
  final String? notes;
  final Color background;
  final bool isDone;
  final bool isCanceled;
  final bool isInitial;
  const Visit(
      {required this.id,
      required this.patientId,
      required this.eventName,
      required this.isAllDay,
      required this.from,
      required this.to,
      this.weight,
      this.notes,
      required this.background,
      required this.isDone,
      required this.isCanceled,
      required this.isInitial});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    map['event_name'] = Variable<String>(eventName);
    map['is_all_day'] = Variable<bool>(isAllDay);
    map['from'] = Variable<DateTime>(from);
    map['to'] = Variable<DateTime>(to);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    {
      final converter = $VisitsTable.$converterbackground;
      map['background'] = Variable<String>(converter.toSql(background));
    }
    map['is_done'] = Variable<bool>(isDone);
    map['is_canceled'] = Variable<bool>(isCanceled);
    map['is_initial'] = Variable<bool>(isInitial);
    return map;
  }

  VisitsCompanion toCompanion(bool nullToAbsent) {
    return VisitsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      eventName: Value(eventName),
      isAllDay: Value(isAllDay),
      from: Value(from),
      to: Value(to),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      background: Value(background),
      isDone: Value(isDone),
      isCanceled: Value(isCanceled),
      isInitial: Value(isInitial),
    );
  }

  factory Visit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visit(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      eventName: serializer.fromJson<String>(json['eventName']),
      isAllDay: serializer.fromJson<bool>(json['isAllDay']),
      from: serializer.fromJson<DateTime>(json['from']),
      to: serializer.fromJson<DateTime>(json['to']),
      weight: serializer.fromJson<double?>(json['weight']),
      notes: serializer.fromJson<String?>(json['notes']),
      background: serializer.fromJson<Color>(json['background']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      isCanceled: serializer.fromJson<bool>(json['isCanceled']),
      isInitial: serializer.fromJson<bool>(json['isInitial']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'eventName': serializer.toJson<String>(eventName),
      'isAllDay': serializer.toJson<bool>(isAllDay),
      'from': serializer.toJson<DateTime>(from),
      'to': serializer.toJson<DateTime>(to),
      'weight': serializer.toJson<double?>(weight),
      'notes': serializer.toJson<String?>(notes),
      'background': serializer.toJson<Color>(background),
      'isDone': serializer.toJson<bool>(isDone),
      'isCanceled': serializer.toJson<bool>(isCanceled),
      'isInitial': serializer.toJson<bool>(isInitial),
    };
  }

  Visit copyWith(
          {int? id,
          int? patientId,
          String? eventName,
          bool? isAllDay,
          DateTime? from,
          DateTime? to,
          Value<double?> weight = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Color? background,
          bool? isDone,
          bool? isCanceled,
          bool? isInitial}) =>
      Visit(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        eventName: eventName ?? this.eventName,
        isAllDay: isAllDay ?? this.isAllDay,
        from: from ?? this.from,
        to: to ?? this.to,
        weight: weight.present ? weight.value : this.weight,
        notes: notes.present ? notes.value : this.notes,
        background: background ?? this.background,
        isDone: isDone ?? this.isDone,
        isCanceled: isCanceled ?? this.isCanceled,
        isInitial: isInitial ?? this.isInitial,
      );
  @override
  String toString() {
    return (StringBuffer('Visit(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('eventName: $eventName, ')
          ..write('isAllDay: $isAllDay, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('weight: $weight, ')
          ..write('notes: $notes, ')
          ..write('background: $background, ')
          ..write('isDone: $isDone, ')
          ..write('isCanceled: $isCanceled, ')
          ..write('isInitial: $isInitial')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patientId, eventName, isAllDay, from, to,
      weight, notes, background, isDone, isCanceled, isInitial);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visit &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.eventName == this.eventName &&
          other.isAllDay == this.isAllDay &&
          other.from == this.from &&
          other.to == this.to &&
          other.weight == this.weight &&
          other.notes == this.notes &&
          other.background == this.background &&
          other.isDone == this.isDone &&
          other.isCanceled == this.isCanceled &&
          other.isInitial == this.isInitial);
}

class VisitsCompanion extends UpdateCompanion<Visit> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<String> eventName;
  final Value<bool> isAllDay;
  final Value<DateTime> from;
  final Value<DateTime> to;
  final Value<double?> weight;
  final Value<String?> notes;
  final Value<Color> background;
  final Value<bool> isDone;
  final Value<bool> isCanceled;
  final Value<bool> isInitial;
  const VisitsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.isAllDay = const Value.absent(),
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.weight = const Value.absent(),
    this.notes = const Value.absent(),
    this.background = const Value.absent(),
    this.isDone = const Value.absent(),
    this.isCanceled = const Value.absent(),
    this.isInitial = const Value.absent(),
  });
  VisitsCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    required String eventName,
    this.isAllDay = const Value.absent(),
    required DateTime from,
    required DateTime to,
    this.weight = const Value.absent(),
    this.notes = const Value.absent(),
    this.background = const Value.absent(),
    this.isDone = const Value.absent(),
    this.isCanceled = const Value.absent(),
    this.isInitial = const Value.absent(),
  })  : patientId = Value(patientId),
        eventName = Value(eventName),
        from = Value(from),
        to = Value(to);
  static Insertable<Visit> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<String>? eventName,
    Expression<bool>? isAllDay,
    Expression<DateTime>? from,
    Expression<DateTime>? to,
    Expression<double>? weight,
    Expression<String>? notes,
    Expression<String>? background,
    Expression<bool>? isDone,
    Expression<bool>? isCanceled,
    Expression<bool>? isInitial,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (eventName != null) 'event_name': eventName,
      if (isAllDay != null) 'is_all_day': isAllDay,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (weight != null) 'weight': weight,
      if (notes != null) 'notes': notes,
      if (background != null) 'background': background,
      if (isDone != null) 'is_done': isDone,
      if (isCanceled != null) 'is_canceled': isCanceled,
      if (isInitial != null) 'is_initial': isInitial,
    });
  }

  VisitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? patientId,
      Value<String>? eventName,
      Value<bool>? isAllDay,
      Value<DateTime>? from,
      Value<DateTime>? to,
      Value<double?>? weight,
      Value<String?>? notes,
      Value<Color>? background,
      Value<bool>? isDone,
      Value<bool>? isCanceled,
      Value<bool>? isInitial}) {
    return VisitsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      eventName: eventName ?? this.eventName,
      isAllDay: isAllDay ?? this.isAllDay,
      from: from ?? this.from,
      to: to ?? this.to,
      weight: weight ?? this.weight,
      notes: notes ?? this.notes,
      background: background ?? this.background,
      isDone: isDone ?? this.isDone,
      isCanceled: isCanceled ?? this.isCanceled,
      isInitial: isInitial ?? this.isInitial,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    if (isAllDay.present) {
      map['is_all_day'] = Variable<bool>(isAllDay.value);
    }
    if (from.present) {
      map['from'] = Variable<DateTime>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<DateTime>(to.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (background.present) {
      final converter = $VisitsTable.$converterbackground;
      map['background'] = Variable<String>(converter.toSql(background.value));
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (isCanceled.present) {
      map['is_canceled'] = Variable<bool>(isCanceled.value);
    }
    if (isInitial.present) {
      map['is_initial'] = Variable<bool>(isInitial.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('eventName: $eventName, ')
          ..write('isAllDay: $isAllDay, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('weight: $weight, ')
          ..write('notes: $notes, ')
          ..write('background: $background, ')
          ..write('isDone: $isDone, ')
          ..write('isCanceled: $isCanceled, ')
          ..write('isInitial: $isInitial')
          ..write(')'))
        .toString();
  }
}

abstract class _$PatGestDatabase extends GeneratedDatabase {
  _$PatGestDatabase(QueryExecutor e) : super(e);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $OfficesTable offices = $OfficesTable(this);
  late final $FoodsTable foods = $FoodsTable(this);
  late final $VisitsTable visits = $VisitsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [patients, offices, foods, visits];
}
