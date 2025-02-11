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

/// BEGIN GETBOOKS
Future<List<GetBooksRow>> performGetBooks(
  Database database,
) {
  const query = '''
SELECT * FROM books;

''';
  return _readQuery(database, query, (d) => GetBooksRow(d));
}

class GetBooksRow extends SqliteRow {
  GetBooksRow(super.data);

  int? get id => data['id'] as int?;
  String get title => data['title'] as String;
  String get autor => data['autor'] as String;
  String? get editor => data['editor'] as String?;
  int? get publishYear => data['publish_year'] as int?;
  String? get isbn => data['isbn'] as String?;
  String? get category => data['category'] as String?;
  String? get localization => data['localization'] as String?;
}

/// END GETBOOKS
