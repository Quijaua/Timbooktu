import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'users_list_page_widget.dart' show UsersListPageWidget;
import 'package:flutter/material.dart';

class UsersListPageModel extends FlutterFlowModel<UsersListPageWidget> {
  ///  Local state fields for this page.

  String? searchName;

  ///  State fields for stateful widgets in this page.

  // State field(s) for textSearch widget.
  FocusNode? textSearchFocusNode;
  TextEditingController? textSearchTextController;
  String? Function(BuildContext, String?)? textSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textSearchFocusNode?.dispose();
    textSearchTextController?.dispose();
  }
}
