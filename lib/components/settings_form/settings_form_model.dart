import '/flutter_flow/flutter_flow_util.dart';
import 'settings_form_widget.dart' show SettingsFormWidget;
import 'package:flutter/material.dart';

class SettingsFormModel extends FlutterFlowModel<SettingsFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for loan_time widget.
  FocusNode? loanTimeFocusNode;
  TextEditingController? loanTimeTextController;
  String? Function(BuildContext, String?)? loanTimeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    loanTimeFocusNode?.dispose();
    loanTimeTextController?.dispose();
  }
}
