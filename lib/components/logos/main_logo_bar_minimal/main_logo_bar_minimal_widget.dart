import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_logo_bar_minimal_model.dart';
export 'main_logo_bar_minimal_model.dart';

class MainLogoBarMinimalWidget extends StatefulWidget {
  const MainLogoBarMinimalWidget({super.key});

  @override
  State<MainLogoBarMinimalWidget> createState() =>
      _MainLogoBarMinimalWidgetState();
}

class _MainLogoBarMinimalWidgetState extends State<MainLogoBarMinimalWidget> {
  late MainLogoBarMinimalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainLogoBarMinimalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Image.asset(
        Theme.of(context).brightness == Brightness.dark
            ? 'assets/images/app_launcher_icon.png'
            : 'assets/images/app_launcher_icon.png',
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
