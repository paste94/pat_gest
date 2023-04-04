import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A list of methods to validate [Patient] object fields. When fields are
/// validated this methods returns null. Otherwise they returns the
/// error message which is the reason why the string cannot be validated.

/// This helper method is used to check if a [text] is empty or not.
/// It returns an error text if it's empty, null otherwise
String? _notEmptyValidator(String text) {
  if (text.isEmpty) {
    return 'Can\'t be empty';
  }
  return null;
}

/// Checks the [name] field of a [Patient]
String? nameValidator(String name) {
  return _notEmptyValidator(name);
}

/// Checks the [surname] field of a [Patient]
String? surnameValidator(String surname) {
  return _notEmptyValidator(surname);
}

/// Checks the [height] field of a [Patient]. It must be between 10 and 300 and
/// the string must be parseable as a double.
String? heightValidator(String heightText) {
  final ret = _notEmptyValidator(heightText);
  if (ret != null) {
    return ret;
  }
  try {
    final dbl = double.parse(heightText);
    if (dbl < 10) {
      return 'Patient is a bit too short';
    }
    if (dbl > 300) {
      return 'Patient is a bit too tall';
    }
  } on FormatException {
    return 'Wrong format, try use DOT for decimal part';
  }
  return null;
}

/// Checks the [weight] field of a [Patient]. It must be between 5 and 800 and
/// the string must be parseable as a double.
String? weightValidator(String weightText) {
  final ret = _notEmptyValidator(weightText);
  if (ret != null) {
    return ret;
  }
  try {
    final dbl = double.parse(weightText);
    if (dbl < 5) {
      return 'Patient is a bit too light';
    }
    if (dbl > 800) {
      return 'Patient is a bit too heavy';
    }
  } on FormatException {
    return 'Wrong format, try use DOT for decimal part';
  }
  return null;
}

/// Checks the [email] field of a [Patient]. It could be empty. If
/// the field is not empty then it must be an email address and
/// must respect the defined RegExp.
String? emailValidator(String email) {
  if (email.isEmpty) {
    return null;
  }
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return 'Incorrect email address';
  }
  return null;
}

/// Checks the [email] field of a [Patient]. It must be not null and
/// it must respect the dd/MM/yyyy format. This method also checks
/// whether the patient birth date is between 1900 and the current
/// date.
String? birthDateValidator(String? dateString) {
  if (dateString == null) {
    return 'Date cannot be null';
  }
  try {
    final date = DateFormat('dd/MM/yyyy').parse(dateString);
    if (date.year < 1900) {
      return 'This patiens seems to be too old';
    } else if (date.compareTo(DateTime.now()) > 0) {
      return 'This patiens seems to be born in the future!';
    }
  } on FormatException {
    return 'Date format not supported';
  }
  return null;
}

String? dateValidator(String? dateString) {
  if (dateString == null) {
    return 'Date cannot be null';
  }
  try {
    DateFormat('dd/MM/yyyy').parse(dateString);
  } on FormatException {
    return 'Date format not supported';
  }
  return null;
}

String? timeValidator(String? timeString) {
  if (timeString == null || timeString == '--:--') {
    return 'Time cannot be null';
  }
  try {
    TimeOfDay(
      hour: int.parse(timeString.split(':')[0]),
      minute: int.parse(timeString.split(':')[1]),
    );
  } on FormatException {
    return 'Time format not supported';
  }
  return null;
}
