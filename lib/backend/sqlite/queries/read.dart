import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETUSERS
Future<List<GetUsersRow>> performGetUsers(
  Database database,
) {
  const query = '''
SELECT * FROM users WHERE is_activated = 1 AND is_activated IS NOT NULL;

''';
  return _readQuery(database, query, (d) => GetUsersRow(d));
}

class GetUsersRow extends SqliteRow {
  GetUsersRow(super.data);

  int? get id => data['id'] as int?;
  String? get name => data['name'] as String?;
  String? get email => data['email'] as String?;
  String? get phone => data['phone'] as String?;
  String? get cpf => data['cpf'] as String?;
}

/// END GETUSERS
