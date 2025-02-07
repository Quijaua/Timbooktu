import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_form_widget.dart' show BookFormWidget;
import 'package:flutter/material.dart';

class BookFormModel extends FlutterFlowModel<BookFormWidget> {
  ///  Local state fields for this component.

  GetBooksRow? book;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha esse campo';
    }

    return null;
  }

  // State field(s) for autor widget.
  FocusNode? autorFocusNode;
  TextEditingController? autorTextController;
  String? Function(BuildContext, String?)? autorTextControllerValidator;
  String? _autorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha esse campo';
    }

    return null;
  }

  // State field(s) for editor widget.
  FocusNode? editorFocusNode;
  TextEditingController? editorTextController;
  String? Function(BuildContext, String?)? editorTextControllerValidator;
  // State field(s) for publishYear widget.
  FocusNode? publishYearFocusNode;
  TextEditingController? publishYearTextController;
  String? Function(BuildContext, String?)? publishYearTextControllerValidator;
  // State field(s) for isbn widget.
  FocusNode? isbnFocusNode;
  TextEditingController? isbnTextController;
  String? Function(BuildContext, String?)? isbnTextControllerValidator;
  // State field(s) for category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryTextController;
  String? Function(BuildContext, String?)? categoryTextControllerValidator;
  // State field(s) for localization widget.
  FocusNode? localizationFocusNode;
  TextEditingController? localizationTextController;
  String? Function(BuildContext, String?)? localizationTextControllerValidator;

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    autorTextControllerValidator = _autorTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    autorFocusNode?.dispose();
    autorTextController?.dispose();

    editorFocusNode?.dispose();
    editorTextController?.dispose();

    publishYearFocusNode?.dispose();
    publishYearTextController?.dispose();

    isbnFocusNode?.dispose();
    isbnTextController?.dispose();

    categoryFocusNode?.dispose();
    categoryTextController?.dispose();

    localizationFocusNode?.dispose();
    localizationTextController?.dispose();
  }
}
