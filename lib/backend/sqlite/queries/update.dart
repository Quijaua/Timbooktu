import 'package:sqflite/sqflite.dart';

/// BEGIN ADDUSER
Future performAddUser(
  Database database, {
  String? name,
  String? email,
  String? phone,
  String? cpf,
}) {
  final query = '''
INSERT INTO users (name, email,  phone, cpf)
VALUES ('$name', '$email', '$phone', '$cpf');
''';
  return database.rawQuery(query);
}

/// END ADDUSER

/// BEGIN UPDATEUSER
Future performUpdateUser(
  Database database, {
  String? name,
  String? email,
  String? phone,
  String? cpf,
  int? id,
}) {
  final query = '''
UPDATE users
SET 
    name = '$name',
    email = '$email',
    phone = '$phone',
    cpf = '$cpf'
WHERE id = '$id';
''';
  return database.rawQuery(query);
}

/// END UPDATEUSER

/// BEGIN DELETEUSER
Future performDeleteUser(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM users WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END DELETEUSER
