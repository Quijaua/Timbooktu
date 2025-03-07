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
  Database database, {
  String? name,
}) {
  final query = '''
SELECT *
FROM users
WHERE is_activated = 1 
  AND name LIKE '%' || COALESCE('${name}', '') || '%';

''';
  return _readQuery(database, query, (d) => GetUsersRow(d));
}

class GetUsersRow extends SqliteRow {
  GetUsersRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get name => data['name'] as String?;
  String? get email => data['email'] as String?;
  String? get phone => data['phone'] as String?;
  String? get cpf => data['cpf'] as String?;
}

/// END GETUSERS

/// BEGIN GETBOOKS
Future<List<GetBooksRow>> performGetBooks(
  Database database, {
  String? searchText,
}) {
  final query = '''
SELECT * FROM books 
WHERE is_activated = 1 
  AND (title LIKE '%' || COALESCE('${searchText}', '') || '%' 
       OR autor LIKE '%' || COALESCE('${searchText}', '') || '%');
''';
  return _readQuery(database, query, (d) => GetBooksRow(d));
}

class GetBooksRow extends SqliteRow {
  GetBooksRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String get title => data['title'] as String;
  String get autor => data['autor'] as String;
  String? get editor => data['editor'] as String?;
  int? get publishYear => data['publish_year'] as int?;
  String? get isbn => data['isbn'] as String?;
  String? get category => data['category'] as String?;
  String? get localization => data['localization'] as String?;
  int? get isActivated => data['is_activated'] as int?;
}

/// END GETBOOKS

/// BEGIN GETLOANS
Future<List<GetLoansRow>> performGetLoans(
  Database database, {
  String? searchText,
}) {
  final query = '''
SELECT 
    loans.id AS id,
    books.title AS book_title,
    users.name AS user_name, 
    loans.loan_date, 
    loans.return_date, 
    loans.is_activated
    FROM loans
JOIN 
    books ON loans.book_id = books.id 
JOIN 
    users ON loans.user_id = users.id
WHERE 
    (books.title LIKE '%' || COALESCE('${searchText}', '') || '%' OR '${searchText}' = '');
''';
  return _readQuery(database, query, (d) => GetLoansRow(d));
}

class GetLoansRow extends SqliteRow {
  GetLoansRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get bookTitle => data['book_title'] as String?;
  String? get userName => data['user_name'] as String?;
  String? get loanDate => data['loan_date'] as String?;
  String? get returnDate => data['return_date'] as String?;
  int? get isActivated => data['is_activated'] as int?;
}

/// END GETLOANS

/// BEGIN GETALLUSERS
Future<List<GetAllUsersRow>> performGetAllUsers(
  Database database,
) {
  final query = '''
SELECT *
FROM users
WHERE is_activated = 1;
''';
  return _readQuery(database, query, (d) => GetAllUsersRow(d));
}

class GetAllUsersRow extends SqliteRow {
  GetAllUsersRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get name => data['name'] as String?;
  String? get email => data['email'] as String?;
  String? get phone => data['phone'] as String?;
  String? get cpf => data['cpf'] as String?;
}

/// END GETALLUSERS

/// BEGIN GETLOANSTOUSERID
Future<List<GetLoansToUserIdRow>> performGetLoansToUserId(
  Database database, {
  int? searchId,
}) {
  final query = '''
SELECT 
    loans.id AS id,
    books.title AS book_title,
    users.name AS user_name, 
    loans.loan_date, 
    loans.return_date, 
    loans.is_activated
FROM loans
JOIN books ON loans.book_id = books.id 
JOIN users ON loans.user_id = users.id
WHERE 
    (users.id = COALESCE('${searchId}', users.id) OR '${searchId}' = '');

''';
  return _readQuery(database, query, (d) => GetLoansToUserIdRow(d));
}

class GetLoansToUserIdRow extends SqliteRow {
  GetLoansToUserIdRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get bookTitle => data['book_title'] as String?;
  String? get userName => data['user_name'] as String?;
  String? get loanDate => data['loan_date'] as String?;
  String? get returnDate => data['return_date'] as String?;
  int? get isActivated => data['is_activated'] as int?;
}

/// END GETLOANSTOUSERID

/// BEGIN GETLOANBYID
Future<List<GetLoanByIdRow>> performGetLoanById(
  Database database, {
  int? bookId,
}) {
  final query = '''
SELECT 
    loans.id AS id,
    books.title AS book_title,
    users.name AS user_name, 
    loans.loan_date, 
    loans.return_date, 
    loans.is_activated
    FROM loans
JOIN 
    books ON loans.book_id = books.id 
JOIN 
    users ON loans.user_id = users.id
 WHERE books.id = ${bookId};
''';
  return _readQuery(database, query, (d) => GetLoanByIdRow(d));
}

class GetLoanByIdRow extends SqliteRow {
  GetLoanByIdRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get bookTitle => data['book_title'] as String?;
  String? get userName => data['user_name'] as String?;
  String? get loanDate => data['loan_date'] as String?;
  String? get returnDate => data['return_date'] as String?;
  int? get isActivated => data['is_activated'] as int?;
}

/// END GETLOANBYID
