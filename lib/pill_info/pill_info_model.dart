import '/flutter_flow/flutter_flow_util.dart';
import 'pill_info_widget.dart' show PillInfoWidget;
import 'package:flutter/material.dart';

class PillInfoModel extends FlutterFlowModel<PillInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
