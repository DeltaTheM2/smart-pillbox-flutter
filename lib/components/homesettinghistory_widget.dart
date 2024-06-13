import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'homesettinghistory_model.dart';
export 'homesettinghistory_model.dart';

class HomesettinghistoryWidget extends StatefulWidget {
  const HomesettinghistoryWidget({super.key});

  @override
  State<HomesettinghistoryWidget> createState() =>
      _HomesettinghistoryWidgetState();
}

class _HomesettinghistoryWidgetState extends State<HomesettinghistoryWidget> {
  late HomesettinghistoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomesettinghistoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1.02, 1.0),
      child: Container(
        width: 394.0,
        height: 90.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: const Color(0x00FFFFFF),
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 130.0,
                fillColor: const Color(0x00FFFFFF),
                icon: Icon(
                  Icons.house_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 70.0,
                ),
                onPressed: () async {
                  context.pushNamed('HomePage');
                },
              ),
            ),
            FlutterFlowIconButton(
              borderColor: const Color(0x00FFFFFF),
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 130.0,
              fillColor: const Color(0x00FFFFFF),
              icon: Icon(
                Icons.settings,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 70.0,
              ),
              onPressed: () async {
                context.pushNamed('Settings');
              },
            ),
            FlutterFlowIconButton(
              borderColor: const Color(0x00FFFFFF),
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 130.0,
              fillColor: const Color(0x00FFFFFF),
              icon: Icon(
                Icons.history,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 50.0,
              ),
              onPressed: () async {
                context.pushNamed('History');
              },
            ),
          ],
        ),
      ),
    );
  }
}
