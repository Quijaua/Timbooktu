import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'books_list_page_widget.dart' show BooksListPageWidget;
import 'package:flutter/material.dart';

class BooksListPageModel extends FlutterFlowModel<BooksListPageWidget> {
  ///  Local state fields for this page.

  String? searchText;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchText widget.
  FocusNode? searchTextFocusNode;
  TextEditingController? searchTextTextController;
  String? Function(BuildContext, String?)? searchTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();
  }
}
