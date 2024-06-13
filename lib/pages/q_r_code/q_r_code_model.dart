import '/flutter_flow/flutter_flow_util.dart';
import 'q_r_code_widget.dart' show QRCodeWidget;
import 'package:flutter/material.dart';

class QRCodeModel extends FlutterFlowModel<QRCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var barcodeValue = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
