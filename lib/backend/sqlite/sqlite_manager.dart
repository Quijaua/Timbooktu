import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'timbooktu_d_b',
      'timbooktu.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetUsersRow>> getUsers() => performGetUsers(
        _database,
      );

  Future<List<GetBooksRow>> getBooks() => performGetBooks(
        _database,
      );

  Future<List<GetLoansRow>> getLoans() => performGetLoans(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addUser({
    String? name,
    String? email,
    String? phone,
    String? cpf,
  }) =>
      performAddUser(
        _database,
        name: name,
        email: email,
        phone: phone,
        cpf: cpf,
      );

  Future updateUser({
    String? name,
    String? email,
    String? phone,
    String? cpf,
    int? id,
  }) =>
      performUpdateUser(
        _database,
        name: name,
        email: email,
        phone: phone,
        cpf: cpf,
        id: id,
      );

  Future deleteUser({
    int? id,
  }) =>
      performDeleteUser(
        _database,
        id: id,
      );

  Future deleteBook({
    int? id,
  }) =>
      performDeleteBook(
        _database,
        id: id,
      );

  Future addBook({
    String? title,
    String? autor,
    String? editor,
    int? publishyear,
    String? isbn,
    String? category,
    String? localization,
  }) =>
      performAddBook(
        _database,
        title: title,
        autor: autor,
        editor: editor,
        publishyear: publishyear,
        isbn: isbn,
        category: category,
        localization: localization,
      );

  Future updateBook({
    String? title,
    String? autor,
    String? editor,
    int? publishyear,
    String? isbn,
    String? category,
    String? localization,
    int? id,
  }) =>
      performUpdateBook(
        _database,
        title: title,
        autor: autor,
        editor: editor,
        publishyear: publishyear,
        isbn: isbn,
        category: category,
        localization: localization,
        id: id,
      );

  Future addLoan({
    int? bookid,
    int? userid,
    int? returnDateDays,
  }) =>
      performAddLoan(
        _database,
        bookid: bookid,
        userid: userid,
        returnDateDays: returnDateDays,
      );

  Future returnLoan({
    int? id,
  }) =>
      performReturnLoan(
        _database,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}
