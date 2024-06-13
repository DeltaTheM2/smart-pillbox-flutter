import '/flutter_flow/flutter_flow_util.dart';
import 'pills_widget.dart' show PillsWidget;
import 'package:flutter/material.dart';

class PillsModel extends FlutterFlowModel<PillsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
