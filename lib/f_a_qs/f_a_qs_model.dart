import '/flutter_flow/flutter_flow_util.dart';
import 'f_a_qs_widget.dart' show FAQsWidget;
import 'package:flutter/material.dart';

class FAQsModel extends FlutterFlowModel<FAQsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
