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
VALUES ('${name}', '${email}', '${phone}', '${cpf}');
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
    name = '${name}',
    email = '${email}',
    phone = '${phone}',
    cpf = '${cpf}'
WHERE id = '${id}';
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
DELETE FROM users WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETEUSER

/// BEGIN DELETEBOOK
Future performDeleteBook(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM books WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETEBOOK

/// BEGIN ADDBOOK
Future performAddBook(
  Database database, {
  String? title,
  String? autor,
  String? editor,
  int? publishyear,
  String? isbn,
  String? category,
  String? localization,
}) {
  final query = '''
INSERT INTO books (title, autor, editor, publish_year, isbn, category, localization)
VALUES ('${title}', '${autor}', '${editor}', ${publishyear}, '${isbn}', '${category}', '${localization}');
''';
  return database.rawQuery(query);
}

/// END ADDBOOK

/// BEGIN UPDATEBOOK
Future performUpdateBook(
  Database database, {
  String? title,
  String? autor,
  String? editor,
  int? publishyear,
  String? isbn,
  String? category,
  String? localization,
  int? id,
}) {
  final query = '''
UPDATE books
SET title = '${title}',
    autor = '${autor}',
    editor = '${editor}',
    publish_year = ${publishyear},
    isbn = '${isbn}',
    category = '${category}',
    localization = '${localization}'
WHERE id = ${id};

''';
  return database.rawQuery(query);
}

/// END UPDATEBOOK

/// BEGIN ADDLOAN
Future performAddLoan(
  Database database, {
  int? bookid,
  int? userid,
  int? returnDateDays,
}) {
  final query = '''
INSERT INTO loans (book_id, user_id, loan_date, return_date) 
VALUES ('${bookid}', '${userid}', CURRENT_DATE, DATE(CURRENT_DATE, '+${returnDateDays} days'));

''';
  return database.rawQuery(query);
}

/// END ADDLOAN

/// BEGIN RETURNLOAN
Future performReturnLoan(
  Database database, {
  int? id,
}) {
  final query = '''
UPDATE loans
SET is_activated = 0,
WHERE id = ${id};

''';
  return database.rawQuery(query);
}

/// END RETURNLOAN
