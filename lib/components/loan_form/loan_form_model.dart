import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'loan_form_widget.dart' show LoanFormWidget;
import 'package:flutter/material.dart';

class LoanFormModel extends FlutterFlowModel<LoanFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  String? nameValue;
  FormFieldController<String>? nameValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
