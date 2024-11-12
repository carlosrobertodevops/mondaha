import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_logo_small_model.dart';
export 'main_logo_small_model.dart';

class MainLogoSmallWidget extends StatefulWidget {
  const MainLogoSmallWidget({super.key});

  @override
  State<MainLogoSmallWidget> createState() => _MainLogoSmallWidgetState();
}

class _MainLogoSmallWidgetState extends State<MainLogoSmallWidget> {
  late MainLogoSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainLogoSmallModel());

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
        width: 170.0,
        height: 100.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
